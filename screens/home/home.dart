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
          final nome =
              candidato["nome"]!.toLowerCase();
          final partido =
              candidato["partido"]!.toLowerCase();
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
            ? const Color(0xFF4EA56F)
            : Colors.redAccent,
        duration: const Duration(seconds: 2),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView( //scroll
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB( //left, topo, right, baixo
                20,
                60,
                20,
                30,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF203864),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //alinha o conteúdo do cabeçalho pra esquerda
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/img/logo.jpg",
                        width: 45,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "VOTO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "CONSCIENTE",
                            style: TextStyle(
                              color: Color(0xFF8CC084),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Olá, eleitor!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Informação de qualidade para\n"
                    "decisões conscientes.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 25),
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          "Buscar temas, candidatos ou propostas",
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      suffixIcon:
                          pesquisaController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    pesquisaController.clear(); //limpar só se tiber algo escrito
                                    setState(() {
                                      candidatosFiltrados = List.from(candidatos);
                                    });
                                    focoPesquisa.requestFocus();
                                  },
                                )
                              : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  if (mostrarResultadosPesquisa)
                    Container(
                      margin: const EdgeInsets.only(top: 8), //lista aparece só quando clicar no campo de pesquisa
                      constraints: const BoxConstraints( //limita altura da lista
                        maxHeight: 260,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: candidatosFiltrados.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "Nenhum candidato encontrado.",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true, //lista usa somente o espaço necessário
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              itemCount:
                                  candidatosFiltrados.length,
                              separatorBuilder:
                                  (context, index) {
                                return const Divider(
                                  height: 1,
                                );
                              },
                              itemBuilder: (context, index) {
                                final candidato = candidatosFiltrados[index];
                                return ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor:
                                        Color(0xFFE0E0E0),
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xFF203864),
                                    ),
                                  ),
                                  title: Text(
                                    candidato["nome"]!,
                                    style: const TextStyle(
                                      color: Color(0xFF203864),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    candidato["partido"]!,
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Color(0xFF4EA56F),
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
                    ),
                  const SizedBox(height: 20),
                  const Text(
                    "Acesse por tema",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12), //card verde
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4EA56F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Compare candidatos e propostas",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Veja quem mais se alinha com o que você acredita.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () { //direcionamento
                            Navigator.pushNamed(
                              context,
                              RotasApp.comparacao,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFD8B85A),
                            foregroundColor:
                                const Color(0xFF203864),
                          ),
                          child: const Text(
                            "Comparar agora",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding( //título e botão de "ver todos"
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Candidatos em destaque",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF203864),
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
                        color: Color(0xFF4EA56F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox( //linha dos candidatos em destaque
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
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
            Padding( //notificações
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      notificacoesAtivadas //icon muda conforme o estado
                          ? Icons.notifications_active
                          : Icons.notifications_none,
                      size: 40,
                      color: notificacoesAtivadas
                          ? const Color(0xFF4EA56F)
                          : const Color(0xFFD8B85A),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            notificacoesAtivadas
                                ? "Notificações ativadas"
                                : "Fique informado",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            notificacoesAtivadas
                                ? "Você receberá novidades sobre o processo eleitoral."
                                : "Ative notificações sobre o processo eleitoral.",
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          InkWell( //deixa o texto clicável
                            onTap: alterarNotificacoes,
                            child: Text(
                              notificacoesAtivadas
                                  ? "Desativar notificações"
                                  : "Ativar notificações",
                              style: TextStyle(
                                color: notificacoesAtivadas
                                    ? Colors.redAccent
                                    : const Color(0xFF4EA56F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: alterarNotificacoes, 
                      icon: Icon(
                        notificacoesAtivadas
                            ? Icons.notifications_off_outlined
                            : Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( 
        currentIndex: 0,
        type: BottomNavigationBarType.fixed, //garantir que mantenha cores fixas durante a navegação
        selectedItemColor: const Color(0xFF203864),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Candidatos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Notícias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Meu Perfil",
          ),
        ],
        onTap: (indice) {
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
        },
      ),
    );
  }
  Widget candidatoCard( //cria o card usado na lista de candidatos em destaque 
    BuildContext context,
    String nome,
    String partido,
  ) {
    return InkWell(
      onTap: () { //direciona pra tela dos candidatos
        Navigator.pushNamed(
          context,
          RotasApp.candidatos,
        );
      },
      borderRadius: BorderRadius.circular(15),

      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
        ),
        width: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFE0E0E0),
              child: Icon(
                Icons.person,
                color: Color(0xFF203864),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    overflow: TextOverflow.ellipsis, //evita que nomes grandes ultrapassem o card
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    partido,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
