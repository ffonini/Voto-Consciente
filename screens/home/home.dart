
import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaHome extends StatefulWidget { //StatefulWidget deve ser usado pq elementos vão ser alterados conforme o usuário
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final TextEditingController pesquisaController = TextEditingController(); //controla o texto digitado no campo de pesquisa.
  final FocusNode focoPesquisa = FocusNode();

  bool notificacoesAtivadas = false;
  bool mostrarResultadosPesquisa = false;

  static const Color _azul = Color(0xFF1F3A5F);
  static const Color _verde = Color(0xFF087F5B);
  static const Color _amarelo = Color(0xFFE9B949);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _cinzaTexto = Color(0xFF64748B);

  final List<Map<String, String>> candidatos = [
    {
      "nome": "Lula",
      "partido": "Partido PT",
    },
    {
      "nome": "Flávio Bolsonaro",
      "partido": "Partido PL",
    },
    {
      "nome": "Renan Santos",
      "partido": "Partido Missão",
    },
    {
      "nome": "Augusto Cury",
      "partido": "Partido Avante",
    },
    {
      "nome": "Ronaldo Caiado",
      "partido": "Partido PSD",
    },
    {
      "nome": "Romeu Zema",
      "partido": "Partido Novo",
    },
  ];

  late List<Map<String, String>> candidatosFiltrados; //lsita que guarda os resultados

  @override
  void initState() {
    super.initState();

    candidatosFiltrados = List.from(candidatos);

    focoPesquisa.addListener(() {
      if (!mounted) return;

      setState(() {
        mostrarResultadosPesquisa = focoPesquisa.hasFocus;
      });
    });
  }

  void pesquisarCandidato(String textoDigitado) { //funcão que pesquisa o candidato
    final pesquisa = textoDigitado.toLowerCase().trim(); //converte o texto para minúsculo e remove espaços desnecessários

    setState(() {
      mostrarResultadosPesquisa = true; //lista aparece enquanto o usuário pesquisa

      if (pesquisa.isEmpty) { //se o campo estiver vazio, mostra todos os candidatos
        candidatosFiltrados = List.from(candidatos);
      } else { //filtra os candidatos por nome/ partido
        candidatosFiltrados = candidatos.where((candidato) {
          final nome = candidato["nome"]!.toLowerCase();
          final partido = candidato["partido"]!.toLowerCase();

          return nome.contains(pesquisa) ||
              partido.contains(pesquisa);
        }).toList();
      }
    });
  }

  void alterarNotificacoes() {
    setState(() {
      notificacoesAtivadas = !notificacoesAtivadas; //inverte o valor atual: true/ false
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar(); //remove menagem anterior caso ainda apareça

    ScaffoldMessenger.of(context).showSnackBar( //exibi mensagem
      SnackBar(
        content: Text(
          notificacoesAtivadas
              ? "Notificações ativadas com sucesso."
              : "Notificações desativadas com sucesso.",
        ),
        backgroundColor: notificacoesAtivadas
            ? _verde
            : Colors.redAccent,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _construirCabecalho() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB( //left, topo, right, baixo
        22,
        26,
        22,
        32,
      ),
      decoration: const BoxDecoration(
        color: _azul,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //alinha o conteúdo do cabeçalho pra esquerda
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/img/logo.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VOTO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Text(
                      "CONSCIENTE",
                      style: TextStyle(
                        color: _amarelo,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B4B70),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.how_to_vote_outlined,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          const Text(
            "Olá, eleitor!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.6,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Informação de qualidade para\n"
            "decisões conscientes.",
            style: TextStyle(
              color: Color(0xFFD5DFEB),
              fontSize: 14,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 26),

          TextField( //campo de pesquisa
            controller: pesquisaController,
            focusNode: focoPesquisa,
            onChanged: pesquisarCandidato, //chama essa função quando o texto muda
            onTap: () {
              setState(() {
                mostrarResultadosPesquisa = true;

                if (pesquisaController.text.isEmpty) {
                  candidatosFiltrados = List.from(candidatos);
                }
              });
            },
            textInputAction: TextInputAction.search,
            style: const TextStyle(
              color: _azul,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Buscar temas, candidatos ou propostas",
              hintStyle: const TextStyle(
                color: _cinzaTexto,
                fontSize: 13,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: _azul,
                size: 23,
              ),
              suffixIcon: pesquisaController.text.isNotEmpty
                  ? IconButton(
                      tooltip: "Limpar pesquisa",
                      icon: const Icon(
                        Icons.close_rounded,
                        color: _cinzaTexto,
                      ),
                      onPressed: () {
                        pesquisaController.clear(); //limpar só se tiber algo escrito

                        setState(() {
                          candidatosFiltrados = List.from(candidatos);
                        });

                        focoPesquisa.requestFocus();
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: _amarelo,
                  width: 2,
                ),
              ),
            ),
          ),

          if (mostrarResultadosPesquisa)
            _construirResultadosPesquisa(),

          const SizedBox(height: 28),

          const Row(
            children: [
              Icon(
                Icons.grid_view_rounded,
                color: _amarelo,
                size: 20,
              ),
              SizedBox(width: 9),
              Text(
                "Acesse por tema",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14), //card verde

          _construirCardComparacao(),
        ],
      ),
    );
  }

  Widget _construirResultadosPesquisa() {
    return Container(
      margin: const EdgeInsets.only(top: 8), //lista aparece só quando clicar no campo de pesquisa
      constraints: const BoxConstraints( //limita altura da lista
        maxHeight: 260,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: candidatosFiltrados.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "Nenhum candidato encontrado.",
                  style: TextStyle(
                    color: _cinzaTexto,
                  ),
                ),
              ),
            )
          : ListView.separated(
              shrinkWrap: true, //lista usa somente o espaço necessário
              padding: const EdgeInsets.symmetric(vertical: 6),
              itemCount: candidatosFiltrados.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  indent: 68,
                  color: Color(0xFFEDF0F4),
                );
              },
              itemBuilder: (context, index) {
                final candidato = candidatosFiltrados[index];

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 3,
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE8EEF6),
                    child: Icon(
                      Icons.person_outline_rounded,
                      color: _azul,
                    ),
                  ),
                  title: Text(
                    candidato["nome"]!,
                    style: const TextStyle(
                      color: _azul,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    candidato["partido"]!,
                    style: const TextStyle(
                      color: _cinzaTexto,
                      fontSize: 12,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: _verde,
                  ),
                  onTap: () {
                    focoPesquisa.unfocus();

                    Navigator.pushNamed(
                      context,
                      RotasApp.candidatos,
                    );
                  },
                );
              },
            ),
    );
  }

  Widget _construirCardComparacao() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _verde,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: _verde.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.compare_arrows_rounded,
              color: Colors.white,
              size: 25,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Compare candidatos\ne propostas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Veja quem mais se alinha com o que você acredita.",
            style: TextStyle(
              color: Color(0xFFE1F2EA),
              fontSize: 13,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 46,
            child: ElevatedButton.icon(
              onPressed: () { //direcionamento
                Navigator.pushNamed(
                  context,
                  RotasApp.comparacao,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _amarelo,
                foregroundColor: _azul,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              icon: const Icon(
                Icons.arrow_forward_rounded,
                size: 19,
              ),
              label: const Text(
                "Comparar agora",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirSecaoCandidatos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding( //título e botão de "ver todos"
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Candidatos em destaque",
                  style: TextStyle(
                    color: _azul,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RotasApp.candidatos,
                  );
                },
                child: const Text(
                  "Ver todos",
                  style: TextStyle(
                    color: _verde,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        SizedBox( //linha dos candidatos em destaque
          height: 124,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              candidatoCard(
                context,
                "Lula",
                "Partido PT",
              ),
              candidatoCard(
                context,
                "Flávio Bolsonaro",
                "Partido PL",
              ),
              candidatoCard(
                context,
                "Renan Santos",
                "Partido Missão",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _construirCardNotificacoes() {
    return Padding( //notificações
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE7ECF2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.035),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: notificacoesAtivadas
                    ? const Color(0xFFE8F5EF)
                    : const Color(0xFFFFF7DF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                notificacoesAtivadas //icon muda conforme o estado
                    ? Icons.notifications_active_outlined
                    : Icons.notifications_none_rounded,
                size: 26,
                color: notificacoesAtivadas
                    ? _verde
                    : const Color(0xFFB78C20),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificacoesAtivadas
                        ? "Notificações ativadas"
                        : "Fique informado",
                    style: const TextStyle(
                      color: _azul,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    notificacoesAtivadas
                        ? "Você receberá novidades sobre o processo eleitoral."
                        : "Ative notificações sobre o processo eleitoral.",
                    style: const TextStyle(
                      color: _cinzaTexto,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 9),

                  InkWell( //deixa o texto clicável
                    onTap: alterarNotificacoes,
                    borderRadius: BorderRadius.circular(6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      child: Text(
                        notificacoesAtivadas
                            ? "Desativar notificações"
                            : "Ativar notificações",
                        style: TextStyle(
                          color: notificacoesAtivadas
                              ? Colors.redAccent
                              : _verde,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 4),

            IconButton(
              onPressed: alterarNotificacoes,
              tooltip: notificacoesAtivadas
                  ? "Desativar notificações"
                  : "Ativar notificações",
              icon: Icon(
                notificacoesAtivadas
                    ? Icons.notifications_off_outlined
                    : Icons.chevron_right_rounded,
                color: _azul,
                size: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navegar(int indice) {
    if (indice == 0) {
      return;
    }

    if (indice == 1) {
      Navigator.pushNamed(
        context,
        RotasApp.candidatos,
      );
    }

    if (indice == 2) {
      Navigator.pushNamed(
        context,
        RotasApp.dicionario,
      );
    }

    if (indice == 3) {
      Navigator.pushNamed(
        context,
        RotasApp.perfil,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView( //scroll
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 720,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _construirCabecalho(),

                  const SizedBox(height: 28),

                  _construirSecaoCandidatos(),

                  const SizedBox(height: 8),

                  _construirCardNotificacoes(),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: _navegar,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE8F5EF),
        surfaceTintColor: Colors.white,
        elevation: 2,
        height: 72,
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow,
        //garantir que mantenha cores fixas durante a navegação
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: _verde,
            ),
            label: "Início",
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(
              Icons.people_rounded,
              color: _verde,
            ),
            label: "Candidatos",
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(
              Icons.menu_book_rounded,
              color: _verde,
            ),
            label: "Notícias",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(
              Icons.person_rounded,
              color: _verde,
            ),
            label: "Meu Perfil",
          ),
        ],
      ),
    );
  }

  Widget candidatoCard( //cria o card usado na lista de candidatos em destaque 
    BuildContext context,
    String nome,
    String partido,
  ) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 196,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: () { //direciona pra tela dos candidatos
            Navigator.pushNamed(
              context,
              RotasApp.candidatos,
            );
          },
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE7ECF2),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 23,
                  backgroundColor: Color(0xFFE8EEF6),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: _azul,
                    size: 26,
                  ),
                ),

                const SizedBox(width: 11),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, //evita que nomes grandes ultrapassem o card
                        style: const TextStyle(
                          color: _azul,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        partido,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _cinzaTexto,
                          fontSize: 11,
                        ),
                      ),
                    ],
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
  void dispose() {
    pesquisaController.dispose();
    focoPesquisa.dispose();
    super.dispose();
  }
}
