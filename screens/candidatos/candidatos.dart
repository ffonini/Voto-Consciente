import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaCandidatos extends StatelessWidget {
  const TelaCandidatos({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            25,
            20,
            10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Candidatos",
                style: TextStyle(
                  color: Color(0xFF3E886C),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Conheça os candidatos à\npresidência",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 22),
              const Divider(
                color: Color(0xFF304468),
                thickness: 1.5,
                height: 1,
              ),
              const SizedBox(height: 15),
              Row( //botão de comparar
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () { //direciomaneto pra tela comparacao.dart
                      Navigator.pushNamed(
                        context,
                        RotasApp.comparacao,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Comparar",
                            style: TextStyle(
                              color: Color(0xFF304468),
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.compare_arrows,
                            color: Color(0xFF304468),
                            size: 23,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  children: [
                    cardCandidato(
                      context: context,
                      nome: "Lula",
                      partido: "Partido PT",
                      foto: "assets/img/lula.png",
                      patrimonio: "Consulte a fonte oficial",
                      indices: {
                        "Saúde": 70,
                        "Educação": 82,
                        "Segurança": 55,
                        "Transporte": 64,
                        "Emprego": 76,
                        "Meio ambiente": 68,
                        "Combate à corrupção": 58,
                        "Moradia": 73,
                      },
                    ),
                    cardCandidato(
                      context: context,
                      nome: "Flávio Bolsonaro",
                      partido: "Partido PL",
                      foto: "assets/img/bolsonaro.png",
                      patrimonio: "Consulte a fonte oficial",
                      indices: {
                        "Saúde": 61,
                        "Educação": 54,
                        "Segurança": 85,
                        "Transporte": 57,
                        "Emprego": 72,
                        "Meio ambiente": 48,
                        "Combate à corrupção": 62,
                        "Moradia": 51,
                      },
                    ),
                    cardCandidato(
                      context: context,
                      nome: "Renan Santos",
                      partido: "Partido Missão",
                      foto: "assets/img/renan.png",
                      patrimonio: "Consulte a fonte oficial",
                      indices: {
                        "Saúde": 57,
                        "Educação": 71,
                        "Segurança": 74,
                        "Transporte": 50,
                        "Emprego": 80,
                        "Meio ambiente": 53,
                        "Combate à corrupção": 84,
                        "Moradia": 49,
                      },
                    ),
                    cardCandidato(
                      context: context,
                      nome: "Augusto Cury",
                      partido: "Partido Avante",
                      foto: "assets/img/cury.png",
                      patrimonio: "Consulte a fonte oficial",
                      indices: {
                        "Saúde": 74,
                        "Educação": 89,
                        "Segurança": 51,
                        "Transporte": 45,
                        "Emprego": 63,
                        "Meio ambiente": 59,
                        "Combate à corrupção": 60,
                        "Moradia": 55,
                      },
                    ),
                    cardCandidato(
                      context: context,
                      nome: "Ronaldo Caiado",
                      partido: "Partido PSD",
                      foto: "assets/img/caiado.png",
                      patrimonio: "Consulte a fonte oficial",
                      indices: {
                        "Saúde": 81,
                        "Educação": 60,
                        "Segurança": 79,
                        "Transporte": 58,
                        "Emprego": 70,
                        "Meio ambiente": 56,
                        "Combate à corrupção": 65,
                        "Moradia": 52,
                      },
                    ),
                    cardCandidato(
                      context: context,
                      nome: "Romeu Zema",
                      partido: "Partido Novo",
                      foto: "assets/img/zema.png",
                      patrimonio: "Consulte a fonte oficial",
                      indices: {
                        "Saúde": 62,
                        "Educação": 67,
                        "Segurança": 71,
                        "Transporte": 69,
                        "Emprego": 86,
                        "Meio ambiente": 54,
                        "Combate à corrupção": 78,
                        "Moradia": 48,
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( //barra inferior
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF304468),
        unselectedItemColor: Colors.black87,
        backgroundColor: const Color(0xFFD1D1D1),
        iconSize: 25,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: "Candidatos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: "Dicionário",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Meu Perfil",
          ),
        ],
        onTap: (indice) { //direciona pra home
          if (indice == 0) {
            Navigator.pushReplacementNamed(
              context,
              RotasApp.home,
            );
          }
          if (indice == 1) {
            return;
          }
          if (indice == 2) { //direciona pro dicionario
            Navigator.pushReplacementNamed(
              context,
              RotasApp.dicionario,
            );
          }
          if (indice == 3) { //direciona pro perfil
            Navigator.pushReplacementNamed(
              context,
              RotasApp.perfil,
            );
          }
        },
      ),
    );
  }
  Widget cardCandidato({
    required BuildContext context,
    required String nome,
    required String partido,
    required String foto,
    required String patrimonio,
    required Map<String, int> indices,
  }) {
    return InkWell( //permite abrir o card inteiro
      borderRadius: BorderRadius.circular(17),
      onTap: () { //click=abre o card
        mostrarDetalhesCandidato(
          context: context,
          nome: nome,
          partido: partido,
          foto: foto,
          patrimonio: patrimonio,
          indices: indices,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 13,
        ),
        height: 72,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFD0D0D0),
              backgroundImage: AssetImage(foto),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Color(0xFF263A60),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    partido,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios, //seta é só charme, o card em si já esta interativo
              color: Color(0xFF3E886C),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
  void mostrarDetalhesCandidato({ //card individual quando clicar
    required BuildContext context,
    required String nome,
    required String partido,
    required String foto,
    required String patrimonio,
    required Map<String, int> indices,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true, //permite fechar clicando fora do card
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 35,
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight:
                  MediaQuery.of(context).size.height * 0.88,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: SingleChildScrollView( //libera scroll
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align( //x no canto superiro direito dos cards individuais
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      tooltip: "Fechar",
                      onPressed: () {
                        Navigator.pop(context); //fecha dialog e volta pro candidatos.dart
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFF263A60),
                      ),
                    ),
                  ),

                  Center( //imagem
                    child: CircleAvatar(
                      radius: 58,
                      backgroundColor:
                          const Color(0xFFD0D0D0),
                      backgroundImage: AssetImage(foto),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center( //nome 
                    child: Text(
                      nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF263A60),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center( //partido 
                    child: Text(
                      partido,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF3E886C),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container( //patrimônio
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Color(0xFFD8B85A),
                          size: 30,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Patrimônio declarado",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                patrimonio,
                                style: const TextStyle(
                                  color: Color(0xFF263A60),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Distribuição das propostas por tema",
                    style: TextStyle(
                      color: Color(0xFF263A60),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  ...indices.entries.map( //gera uma barra para cada item do map
                    (item) {
                      return indicadorTema(
                        tema: item.key,
                        porcentagem: item.value,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox( 
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      label: const Text(
                        "Voltar aos candidatos",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF3E886C),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget indicadorTema({
    required String tema,
    required int porcentagem,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          Row( //linha com o tema e percentual
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  tema,
                  style: const TextStyle(
                    color: Color(0xFF263A60),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "$porcentagem%",
                style: const TextStyle(
                  color: Color(0xFF3E886C),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect( //barra horizontal que representa o percentual
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator( //trabalha de 0 a 1, com isso, /100 para a %
              value: porcentagem / 100,
              minHeight: 9,
              backgroundColor: const Color(0xFFE0E0E0),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(
                Color(0xFF3E886C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}