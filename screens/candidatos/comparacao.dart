import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaComparacao extends StatefulWidget { //StatefulWidget é usado pois a tela fica mutável de acordo com as ações do usuário
  const TelaComparacao({super.key});

  @override
  State<TelaComparacao> createState() => _TelaComparacaoState();
}

class _TelaComparacaoState extends State<TelaComparacao> {
  static const Color _azulPrincipal = Color(0xFF1F3A5F);
  static const Color _verdePrincipal = Color(0xFF087F5B);
  static const Color _amarelo = Color(0xFFE9B949);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _textoSecundario = Color(0xFF64748B);
  static const Color _verdeClaro = Color(0xFFE8F5EF);

  final List<Map<String, dynamic>> candidatos = [
  {
    "nome": "Lula",
    "partido": "PT",
    "foto": "assets/img/candidatos/lula.jpg",
    "indices": {
      "Saúde": 78,
      "Educação": 84,
      "Segurança": 61,
      "Transporte": 70,
      "Emprego": 79,
      "Meio ambiente": 75,
      "Combate à corrupção": 58,
      "Moradia": 82,
    },
  },
  {
    "nome": "Flávio Bolsonaro",
    "partido": "PL",
    "foto": "assets/img/candidatos/flavio_bolsonaro.jpg",
    "indices": {
      "Saúde": 65,
      "Educação": 58,
      "Segurança": 88,
      "Transporte": 62,
      "Emprego": 77,
      "Meio ambiente": 49,
      "Combate à corrupção": 68,
      "Moradia": 56,
    },
  },
  {
    "nome": "Renan Santos",
    "partido": "Missão",
    "foto": "assets/img/candidatos/renan_santos.jpg",
    "indices": {
      "Saúde": 62,
      "Educação": 74,
      "Segurança": 79,
      "Transporte": 55,
      "Emprego": 83,
      "Meio ambiente": 57,
      "Combate à corrupção": 88,
      "Moradia": 52,
    },
  },
  {
    "nome": "Augusto Cury",
    "partido": "Avante",
    "foto": "assets/img/candidatos/augusto_cury.jpg",
    "indices": {
      "Saúde": 80,
      "Educação": 92,
      "Segurança": 54,
      "Transporte": 48,
      "Emprego": 69,
      "Meio ambiente": 65,
      "Combate à corrupção": 63,
      "Moradia": 60,
    },
  },
  {
    "nome": "Romeu Zema",
    "partido": "Novo",
    "foto": "assets/img/candidatos/romeu_zema.jpg",
    "indices": {
      "Saúde": 68,
      "Educação": 72,
      "Segurança": 76,
      "Transporte": 75,
      "Emprego": 90,
      "Meio ambiente": 61,
      "Combate à corrupção": 81,
      "Moradia": 51,
    },
  },
  {
    "nome": "Ronaldo Caiado",
    "partido": "PSD",
    "foto": "assets/img/candidatos/ronaldo_caiado.jpg",
    "indices": {
      "Saúde": 86,
      "Educação": 67,
      "Segurança": 84,
      "Transporte": 64,
      "Emprego": 75,
      "Meio ambiente": 59,
      "Combate à corrupção": 70,
      "Moradia": 58,
    },
  },
];

  final List<int> candidatosSelecionados = []; //array que guarda os candidatos selecionados pelo usuário

  void selecionarCandidato(int indice) { //seleciona ou remove candidato
    final bool candidatoJaSelecionado = candidatosSelecionados.contains(indice); //vê se o candidato clicado já está selecionado

    if (!candidatoJaSelecionado && candidatosSelecionados.length == 2) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Você pode selecionar apenas 2 candidatos."),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      if (candidatoJaSelecionado) {
        candidatosSelecionados.remove(indice);
      } else if (candidatosSelecionados.length < 2) {
        candidatosSelecionados.add(indice);
      }
    });
  }

  void compararCandidatos() {
    if (candidatosSelecionados.length != 2) { //regra para selecionar extamente dois candidatos
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Selecione exatamente 2 candidatos."),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final Map<String, dynamic> primeiroCandidato = candidatos[candidatosSelecionados[0]]; //primeiro índice=primeiro candidato da lista
    final Map<String, dynamic> segundoCandidato = candidatos[candidatosSelecionados[1]]; //segundo índice=segundo candidato da lista

    Navigator.pushNamed( //evia os dois mapas completos para resultado.dart
      context,
      RotasApp.resultado,
      arguments: {
        "primeiroCandidato": primeiroCandidato,
        "segundoCandidato": segundoCandidato,
      },
    );
  }

  Widget _cabecalho() {
    final quantidade = candidatosSelecionados.length;
    final bool podeComparar = quantidade == 2;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton.filledTonal(
                onPressed: () => Navigator.pop(context),
                tooltip: "Voltar",
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: _azulPrincipal,
                  minimumSize: const Size(44, 44),
                ),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EEF6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "COMPARAÇÃO",
                  style: TextStyle(
                    color: _azulPrincipal,
                    fontSize: 11,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            "Compare candidatos",
            style: TextStyle(
              color: _azulPrincipal,
              fontSize: 27,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Selecione dois candidatos para consultar seus dados lado a lado.",
            style: TextStyle(
              color: _textoSecundario,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const Icon(
                Icons.people_alt_outlined,
                size: 20,
                color: _verdePrincipal,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  "Escolha os candidatos",
                  style: TextStyle(
                    color: _azulPrincipal,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: podeComparar
                      ? _verdeClaro
                      : const Color(0xFFE8EEF6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$quantidade/2 selecionados", //contador de selecionados
                  style: TextStyle(
                    color: podeComparar
                        ? _verdePrincipal
                        : _azulPrincipal,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: quantidade / 2,
              minHeight: 5,
              backgroundColor: const Color(0xFFE4E9F0),
              valueColor: const AlwaysStoppedAnimation<Color>(_amarelo),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _gradeCandidatos(double larguraDisponivel) { //permite que a grade ocupe o espaço disponível na tela
    final int colunas = larguraDisponivel >= 560 ? 3 : 2;
    final double fonteEscalada = MediaQuery.textScalerOf(context).scale(14);
    final double alturaCard = fonteEscalada > 20 ? 244 : 205;

    return GridView.builder( //grade com 6 candidatos
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: candidatos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: colunas, //duas colunas
        crossAxisSpacing: 14, //espaçamento horizontal
        mainAxisSpacing: 14, //espaçamento vertical
        mainAxisExtent: alturaCard, //proporção entre largura e altura
      ),
      itemBuilder: (context, indice) {
        final candidato = candidatos[indice];
        final bool selecionado = candidatosSelecionados.contains(indice);
        final bool bloqueado = candidatosSelecionados.length == 2 && !selecionado; //se tiver dois selecionados, o resto é bloqueado

        return cardCandidato(
          indice: indice,
          nome: candidato["nome"] as String,
          partido: candidato["partido"] as String,
          foto: candidato["foto"] as String,
          selecionado: selecionado,
          bloqueado: bloqueado,
        );
      },
    );
  }

  Widget _botaoComparar() { //btn comparar
    final bool podeComparar = candidatosSelecionados.length == 2;

    return Container(
      decoration: const BoxDecoration(
        color: _fundo,
        border: Border(
          top: BorderSide(color: Color(0xFFE7EBF1)),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: podeComparar ? compararCandidatos : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _verdePrincipal, //cor btn habilitado
                disabledBackgroundColor: const Color(0xFFD7DEE5), //cor btn desabilitado
                foregroundColor: Colors.white,
                disabledForegroundColor: const Color(0xFF617184),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: Icon(
                podeComparar
                    ? Icons.compare_arrows_rounded
                    : Icons.people_outline_rounded,
                size: 21,
              ),
              label: Text(
                podeComparar
                    ? "Comparar candidatos"
                    : "Selecione 2 candidatos",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _barraNavegacao() {
    return NavigationBar( //barra inferior
      selectedIndex: 1,
      onDestinationSelected: (indice) {
        if (indice == 0) {
          Navigator.pushReplacementNamed(context, RotasApp.home);
        }
        if (indice == 1) {
          Navigator.pushReplacementNamed(context, RotasApp.candidatos);
        }
        if (indice == 2) {
          Navigator.pushReplacementNamed(context, RotasApp.dicionario);
        }
        if (indice == 3) {
          Navigator.pushReplacementNamed(context, RotasApp.perfil);
        }
      },
      backgroundColor: Colors.white,
      indicatorColor: _verdeClaro,
      surfaceTintColor: Colors.white,
      height: 72,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded, color: _verdePrincipal),
          label: "Início",
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline_rounded),
          selectedIcon: Icon(Icons.people_rounded, color: _verdePrincipal),
          label: "Candidatos",
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_outlined),
          selectedIcon: Icon(Icons.menu_book_rounded, color: _verdePrincipal),
          label: "Dicionário",
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded),
          selectedIcon: Icon(Icons.person_rounded, color: _verdePrincipal),
          label: "Meu Perfil",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final larguraDisponivel = constraints.maxWidth > 760
                ? 760.0
                : constraints.maxWidth;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: _cabecalho()),
                    SliverToBoxAdapter(
                      child: _gradeCandidatos(larguraDisponivel),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 16,
                              color: _textoSecundario,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Indicadores demonstrativos; não são avaliações verificadas.",
                                style: TextStyle(
                                  color: _textoSecundario,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _botaoComparar(),
            _barraNavegacao(),
          ],
        ),
      ),
    );
  }

  Widget cardCandidato({
    required int indice,
    required String nome,
    required String partido,
    required String foto,
    required bool selecionado,
    required bool bloqueado,
  }) {
    return Semantics(
      button: true,
      selected: selecionado,
      label: "$nome, $partido${bloqueado ? ', indisponível para seleção' : ''}",
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: bloqueado //fica bloqueado se os dois candidatos ja forem escolhidos
              ? () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Desmarque um candidato antes de escolher outro.",
                      ),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              : () => selecionarCandidato(indice),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200), //candidatos bloqueados ficam levemente apagados
            opacity: bloqueado ? 0.48 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: selecionado ? _verdeClaro : Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack( //permite colocar o ícone de confirmação sobre a foto do candidato
                    clipBehavior: Clip.none,
                    children: [
                      AnimatedContainer( //borda muda
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all( //borda verde nos candidatos selecionados 
                            color: selecionado
                                ? _verdePrincipal
                                : const Color(0xFFE8EEF6),
                            width: 3,
                          ),
                          boxShadow: selecionado //sombra verde suave quando selecionado
                              ? [
                                  BoxShadow(
                                    color: _verdePrincipal.withValues(alpha: 0.16),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ]
                              : [],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            foto,
                            width: 78,
                            height: 78,
                            fit: BoxFit.cover, //faz a imagem preencher o círculo sem deformação
                            errorBuilder: ( //se não tiver img, fica um icon de uma pessoa
                              context,
                              erro,
                              stackTrace,
                            ) {
                              return Container(
                                width: 78,
                                height: 78,
                                color: const Color(0xFFE8EEF6),
                                child: const Icon(
                                  Icons.person_outline_rounded,
                                  color: _azulPrincipal,
                                  size: 38,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      if (selecionado)
                        const Positioned(
                          right: -4,
                          bottom: 2,
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: _verdePrincipal,
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text( //nome candidato
                    nome,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: selecionado ? _verdePrincipal : _azulPrincipal,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text( //partido
                    partido,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _textoSecundario,
                      fontSize: 12,
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
