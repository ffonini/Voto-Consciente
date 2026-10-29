
import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaInteresses extends StatefulWidget {
  const TelaInteresses({super.key});

  @override
  State<TelaInteresses> createState() =>
      _TelaInteressesState();
}

class _TelaInteressesState extends State<TelaInteresses> {
  List<String> interessesSelecionados = []; //array para selecionar os interesses do usuário

  final List<Map<String, dynamic>> interesses = [
    {
      "nome": "Saúde",
      "icone": Icons.favorite_outline_rounded,
    },
    {
      "nome": "Educação",
      "icone": Icons.school_outlined,
    },
    {
      "nome": "Segurança",
      "icone": Icons.shield_outlined,
    },
    {
      "nome": "Transporte",
      "icone": Icons.directions_bus_outlined,
    },
    {
      "nome": "Emprego",
      "icone": Icons.work_outline_rounded,
    },
    {
      "nome": "Meio Ambiente",
      "icone": Icons.eco_outlined,
    },
    {
      "nome": "Moradia",
      "icone": Icons.home_outlined,
    },
    {
      "nome": "Corrupção",
      "icone": Icons.gavel_rounded,
    },
  ];

  static const Color _azulPrincipal = Color(0xFF1F3A5F);
  static const Color _verdePrincipal = Color(0xFF087F5B);
  static const Color _amarelo = Color(0xFFE9B949);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _verdeClaro = Color(0xFFE8F5EF);

  void _alternarInteresse(String nome) {
    if (interessesSelecionados.contains(nome)) {
      setState(() {
        interessesSelecionados.remove(nome);
      });
    } else {
      if (interessesSelecionados.length < 4) { //escolher até 4 itens
        setState(() {
          interessesSelecionados.add(nome);
        });
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( //msg para o usuário 
          const SnackBar(
            content: Text(
              "Você pode selecionar no máximo 4 interesses.",
            ),
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _continuar() {
    if (interessesSelecionados.length < 2) { //min 2 interesses
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Selecione pelo menos 2 interesses.",
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    debugPrint(interessesSelecionados.toString());

    Navigator.pushNamed(
      context,
      RotasApp.home,
    );
  }

  Widget _construirCard(Map<String, dynamic> interesse) {
    final nome = interesse["nome"] as String;
    final icone = interesse["icone"] as IconData;

    final selecionado = //verifica se esta selecionado
        interessesSelecionados.contains(nome);

    return Semantics(
      button: true,
      selected: selecionado,
      label: nome,
      child: Material(
        color: selecionado ? _verdeClaro : Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => _alternarInteresse(nome),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selecionado
                    ? _verdePrincipal
                    : const Color(0xFFE4E9F0),
                width: selecionado ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.035),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                if (selecionado)
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: _verdePrincipal,
                      size: 22,
                    ),
                  ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selecionado
                                ? const Color(0xFFD2EADF)
                                : const Color(0xFFEDF2F8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            icone,
                            color: selecionado
                                ? _verdePrincipal
                                : _azulPrincipal,
                            size: 29,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          nome,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: selecionado
                                ? _verdePrincipal
                                : _azulPrincipal,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quantidade = interessesSelecionados.length;

    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () { //direcionamento
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: _azulPrincipal,
                        ),
                        tooltip: "Voltar",
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8EEF6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "PERSONALIZAÇÃO",
                          style: TextStyle(
                            color: _azulPrincipal,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    "O que mais importa para você?",
                    style: TextStyle(
                      color: _azulPrincipal,
                      fontSize: 27,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Escolha de 2 a 4 assuntos para personalizar sua experiência.",
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      const Icon(
                        Icons.tune_rounded,
                        color: _verdePrincipal,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "Seus interesses",
                          style: TextStyle(
                            color: _azulPrincipal,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(
                        "$quantidade de 4 selecionados",
                        style: const TextStyle(
                          color: _verdePrincipal,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final largura = constraints.maxWidth;

                        final colunas = largura >= 520 ? 3 : 2;

                        final larguraCard =
                            (largura - (colunas - 1) * 14) / colunas;

                        final alturaCard = larguraCard < 145
                            ? 140.0
                            : 155.0;

                        return GridView.builder(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          itemCount: interesses.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: colunas, //qtd colunas
                            crossAxisSpacing: 14, //espaço horizontal entre os cards
                            mainAxisSpacing: 14, //espaço vertical entre os cards
                            mainAxisExtent: alturaCard, //proporção entre largura e altura
                          ),
                          itemBuilder: (context, index) {
                            final interesse = //recupera o item atual
                                interesses[index];

                            return _construirCard(interesse);
                          },
                        );
                      },
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                    ),
                    decoration: const BoxDecoration(
                      color: _fundo,
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFE7EBF1),
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _continuar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _verdePrincipal,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continuar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
