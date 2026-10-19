import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaComparacao extends StatefulWidget { //StatefulWidget é usado pois a tela fica mutável de acordo com as ações do usuário
  const TelaComparacao({super.key});
  @override
  State<TelaComparacao> createState() =>
      _TelaComparacaoState();
}

class _TelaComparacaoState extends State<TelaComparacao> {
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

    setState(() {
      if (candidatoJaSelecionado) {
        candidatosSelecionados.remove(indice);
      } else if (candidatosSelecionados.length < 2) {
        candidatosSelecionados.add(indice);
      }
    });
    if (!candidatoJaSelecionado && candidatosSelecionados.length == 2 && !candidatosSelecionados.contains(indice)) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Você pode selecionar apenas 2 candidatos.",
            ),
            duration: Duration(seconds: 5),
            ),
        );
    }
}

  void compararCandidatos() {
  if (candidatosSelecionados.length != 2) { //regra para selecionar extamente dois candidatos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Selecione exatamente 2 candidatos.",
        ),
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

  @override
  Widget build(BuildContext context) {
    final bool podeComparar = candidatosSelecionados.length == 2;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            18,
            20,
            10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Comparação",
                style: TextStyle(
                  color: Color(0xFF3E886C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Compare os candidatos e descubra\n"
                "em quais áreas eles têm mais relevância.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${candidatosSelecionados.length}/2 selecionados", //contador de selecionados
                style: TextStyle(
                  color: podeComparar
                      ? const Color(0xFF3E886C)
                      : Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded( //permite que a grade ocupe o espaço disponível na tela
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: GridView.builder( //grade com 6 candidatos
                    itemCount: candidatos.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //duas colunas
                      crossAxisSpacing: 14, //espaçamento horizontal
                      mainAxisSpacing: 14, //espaçamento vertical
                      childAspectRatio: 0.82, //proporção entre largura e altura
                    ),
                    itemBuilder: (context, indice) {
                      final candidato = candidatos[indice];
                      final bool selecionado = candidatosSelecionados.contains(indice);
                      final bool bloqueado = candidatosSelecionados.length == 2 && !selecionado; //se tiver dois selecionados, o resto é bloqueado
                      return cardCandidato(
                        indice: indice,
                        nome: candidato["nome"]!,
                        partido: candidato["partido"]!,
                        foto: candidato["foto"]!,
                        selecionado: selecionado,
                        bloqueado: bloqueado,
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 14),
              SizedBox( //btn comparar
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed:
                      podeComparar ? compararCandidatos : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3E886C), //cor btn habilitado
                    disabledBackgroundColor:
                        const Color(0xFFBDBDBD), //cor btn desabilitado

                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white70,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: Text(
                    podeComparar
                        ? "Comparar candidatos"
                        : "Selecione 2 candidatos",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar( //barra inferior
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFD1D1D1),
        selectedItemColor: const Color(0xFF304468),
        unselectedItemColor: Colors.black87,
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
        onTap: (indice) {
          if (indice == 0) {
            Navigator.pushReplacementNamed(
              context,
              RotasApp.home,
            );
          }
          if (indice == 1) {
            Navigator.pushReplacementNamed(
              context,
              RotasApp.candidatos,
            );
          }
          if (indice == 2) {
            Navigator.pushReplacementNamed(
              context,
              RotasApp.dicionario,
            );
          }
          if (indice == 3) {
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
    required int indice,
    required String nome,
    required String partido,
    required String foto,
    required bool selecionado,
    required bool bloqueado,
  }) {
    return InkWell(
      onTap: bloqueado //fica bloqueado se os dois candidatos ja forem escolhidos
          ? () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Desmarque um candidato antes de escolher outro.",
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          : () {
              selecionarCandidato(indice);
            },
      borderRadius: BorderRadius.circular(18),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200), //candidatos bloqueados ficam levemente apagados
        opacity: bloqueado ? 0.45 : 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack( //permite colocar o ícone de confirmação sobre a foto do candidato
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer( //borda muda
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all( //borda verde nos candidatos selecionados 
                      color: selecionado
                          ? const Color(0xFF3E886C)
                          : Colors.transparent,
                      width: 4,
                    ),
                    boxShadow: selecionado //sombra verde suave quando selecionado
                        ? [
                            BoxShadow(
                              color: const Color(0xFF3E886C)
                                  .withOpacity(0.23),
                              blurRadius: 9,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      foto,

                      width: 86,
                      height: 86,
                      fit: BoxFit.cover, //faz a imagem preencher o círculo sem deformação
                      errorBuilder: ( //se não tiver img, fica um icon de uma pessoa
                        context,
                        erro,
                        stackTrace,
                      ) {
                        return Container(
                          width: 86,
                          height: 86,
                          color: const Color(0xFFD0D0D0),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 44,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (selecionado)
                  const Positioned(
                    right: -2,
                    bottom: 4,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Color(0xFF3E886C),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text( //nome candidato
              nome,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selecionado
                    ? const Color(0xFF3E886C)
                    : const Color(0xFF263A60),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text( //partido
              partido,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}