import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaResultado extends StatelessWidget {
  const TelaResultado({super.key});
  static const Color corPrimeiroCandidato = Color(0xFF3E886C); //cor do primeiro candidato selecionado
  static const Color corSegundoCandidato = Color(0xFFD8B85A); //cor do primeiro candidato selecionado

  @override
  Widget build(BuildContext context) {
    final Object? argumentosRecebidos = ModalRoute.of(context)?.settings.arguments;
    final Map<String, dynamic> argumentos = //argumento do compaaracao.dart recebidos em map
        Map<String, dynamic>.from(
      argumentosRecebidos,
    );

//converte em mapas objetos recebidos
    final Map<String, dynamic> primeiroCandidato = Map<String, dynamic>.from(primeiroRecebido,); 
    final Map<String, dynamic> segundoCandidato = Map<String, dynamic>.from(segundoRecebido,);

// Recupera o mapa de indicadores do primeiro candidato.
    final Map<String, dynamic> indicesPrimeiro = converterIndices(primeiroCandidato["indices"],);
    final Map<String, dynamic> indicesSegundo = converterIndices(primeiroSegundo["indices"],);

    final List<String> temas = [
      "Saúde",
      "Educação",
      "Segurança",
      "Transporte",
      "Emprego",
      "Meio ambiente",
      "Combate à corrupção",
      "Moradia",
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ //botão que retorna para comparacao.dart
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
              const SizedBox(height: 10),
              const Text( //h1
                "Comparação",
                style: TextStyle(
                  color: Color(0xFF3E886C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text( //h2
                "Compare os candidatos e descubra em quais "
                "áreas cada um apresenta maior quantidade "
                "de propostas.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 20), //card com info dos candidatos
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded( //primeiro eleitor selecionado
                          child: candidatoComparado(
                            nome:
                                primeiroCandidato["nome"]
                                    ?.toString() ??
                                "Candidato",
                            partido:
                                primeiroCandidato["partido"]
                                    ?.toString() ??
                                "",
                            foto:
                                primeiroCandidato["foto"]
                                    ?.toString() ??
                                "",
                            cor: corPrimeiroCandidato,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 42,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            "VS",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded( //segundo eleitor selecionado
                          child: candidatoComparado(
                            nome:
                                segundoCandidato["nome"]
                                    ?.toString() ??
                                "Candidato",
                            partido:
                                segundoCandidato["partido"]
                                    ?.toString() ??
                                "",
                            foto:
                                segundoCandidato["foto"]
                                    ?.toString() ??
                                "",
                            cor: corSegundoCandidato,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 18,
                      runSpacing: 8,
                      children: [
                        itemLegenda(
                          nome:
                              primeiroCandidato["nome"]
                                  ?.toString() ??
                              "Primeiro candidato",
                          cor: corPrimeiroCandidato,
                        ),
                        itemLegenda(
                          nome:
                              segundoCandidato["nome"]
                                  ?.toString() ??
                              "Segundo candidato",
                          cor: corSegundoCandidato,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Propostas por tema",
                style: TextStyle(
                  color: Color(0xFF263A60),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Compare os percentuais apresentados por cada candidato.",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              ...temas.map( //percorre pelos temas e cria um card de comparação para cada um
                (tema) {
                  final int valorPrimeiro = converterParaInteiro(indicesPrimeiro[tema],);
                  final int valorSegundo = converterParaInteiro(indicesSegundo[tema],);
                  return cardTema(
                    tema: tema,
                    nomePrimeiro:
                        primeiroCandidato["nome"]
                            ?.toString() ??
                        "Primeiro candidato",
                    valorPrimeiro: valorPrimeiro,
                    nomeSegundo:
                        segundoCandidato["nome"]
                            ?.toString() ??
                        "Segundo candidato",
                    valorSegundo: valorSegundo,
                  );
                },
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EFEA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFF3E886C),
                      size: 21,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Os percentuais representam a distribuição "
                        "das propostas por tema. Os valores não "
                        "representam uma avaliação da qualidade "
                        "dos candidatos.",
                        style: TextStyle(
                          color: Color(0xFF263A60),
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox( //btn para voltar e selecionar outros dois candidatos
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RotasApp.comparacao,
                    );     
                  },
                  icon: const Icon(
                    Icons.compare_arrows,
                  ),
                  label: const Text(
                    "Fazer outra comparação",
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF3E886C),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10),
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

        onTap: (indice) { //navegação ao clicar em um item da barra inferior
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

  Widget candidatoComparado({ 
    required String nome,
    required String partido,
    required String foto,
    required Color cor,
  }) {
    return Column(
      children: [
        Container( //responsável pela borda colorida
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: cor,
              width: 3,
            ),
          ),
          child: ClipOval(
            child: foto.isNotEmpty
                ? Image.asset(
                    foto,
                    width: 86,
                    height: 86,
                    fit: BoxFit.cover, //faz a foto ocupar o círculo sem mudar a imagem
                    errorBuilder: ( //se não tiver img, mostra icon de pessoa
                      context,
                      erro,
                      stackTrace,
                    ) {
                      return imagemPadraoCandidato();
                    },
                  )
                : imagemPadraoCandidato(),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          nome,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF263A60),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
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
    );
  }

  Widget imagemPadraoCandidato() {
    return Container(
      width: 86,
      height: 86,

      color: const Color(0xFFD0D0D0),

      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 42,
      ),
    );
  }

  Widget itemLegenda({
    required String nome,
    required Color cor,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container( //círculo com a cor do candidato
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          nome,
          style: const TextStyle(
            color: Color(0xFF263A60),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget cardTema({
    required String tema,
    required String nomePrimeiro,
    required int valorPrimeiro,
    required String nomeSegundo,
    required int valorSegundo,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 14,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( //nome do tema
            tema,
            style: const TextStyle(
              color: Color(0xFF263A60),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          barraCandidato( //barra primeiro candidato
            nome: nomePrimeiro,
            valor: valorPrimeiro,
            cor: corPrimeiroCandidato,
          ),
          const SizedBox(height: 13),
          barraCandidato( //barra segundo candidato
            nome: nomeSegundo,
            valor: valorSegundo,
            cor: corSegundoCandidato,
          ),
        ],
      ),
    );
  }

  Widget barraCandidato({ //cria a barra horizontal do candidato
    required String nome,
    required int valor,
    required Color cor,
  }) {

    final int valorSeguro = valor.clamp(0, 100); //percentual entre 0 a 100
    return Column(
      children: [
        Row( 
          children: [
            Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: cor,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 7),
            Expanded( //nome candidato
              child: Text(
                nome,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Text( //percentual do candidato
              "$valorSeguro%",
              style: TextStyle(
                color: cor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 7),
        LayoutBuilder(
          builder: (
            context,
            constraints,
          ) {
            final double larguraPreenchida = constraints.maxWidth * (valorSeguro / 100); //cálculo do preenchimento da barra

            return Container(
              width: double.infinity,
              height: 9,
              decoration: BoxDecoration(
                color: const Color(0xFFE3E3E3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                  curve: Curves.easeOut,
                  width: larguraPreenchida,
                  height: 9,
                  decoration: BoxDecoration(
                    color: cor.withOpacity(0.78),
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Map<String, dynamic> converterIndices(
    dynamic indices,
  ) {
    if (indices is Map) {
      return Map<String, dynamic>.from(
        indices,
      );
    }
    return {}; //retorna um mapa vazio caso não existam dados
  }

  int converterParaInteiro(dynamic valor) { //converter valores para int
    if (valor is int) {
      return valor;
    }
    if (valor is double) {
      return valor.round();
    }
    if (valor is String) {
      return int.tryParse(valor) ?? 0;
    }
    return 0;
  }

  Widget telaErro( //mostra se os candiddatos não forem recebidos corretamente 
    BuildContext context,
    String mensagem,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 60,
                  color: Colors.orange,
                ),

                const SizedBox(height: 20),
                Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF263A60),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) { //direciona pra tela anterior = comparacao.dart
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        RotasApp.comparacao,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF3E886C),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Voltar para comparação",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}