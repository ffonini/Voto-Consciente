import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaResultado extends StatelessWidget {
  const TelaResultado({super.key});

  static const Color corPrimeiroCandidato = Color(0xFF087F5B); //cor do primeiro candidato selecionado
  static const Color corSegundoCandidato = Color(0xFFE9B949); //cor do primeiro candidato selecionado

  static const Color _azulPrincipal = Color(0xFF1F3A5F);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _textoSecundario = Color(0xFF64748B);
  static const Color _borda = Color(0xFFE5EAF1);
  static const Color _amareloEscuro = Color(0xFF82600D);

  static const List<String> _temas = [
    'Saúde',
    'Educação',
    'Segurança',
    'Transporte',
    'Emprego',
    'Meio ambiente',
    'Combate à corrupção',
    'Moradia',
  ];

  @override
  Widget build(BuildContext context) {
    final Object? argumentosRecebidos =
        ModalRoute.of(context)?.settings.arguments;

    if (argumentosRecebidos is! Map ||
        argumentosRecebidos['primeiroCandidato'] is! Map ||
        argumentosRecebidos['segundoCandidato'] is! Map) {
      return telaErro(
        context,
        'Não foi possível carregar a comparação. Selecione novamente dois candidatos.',
      );
    }

    final Map<String, dynamic> argumentos = //argumento do compaaracao.dart recebidos em map
        {
      'primeiroCandidato': argumentosRecebidos['primeiroCandidato'],
      'segundoCandidato': argumentosRecebidos['segundoCandidato'],
    };

    //converte em mapas objetos recebidos
    final Map<String, dynamic> primeiroCandidato =
        Map<String, dynamic>.from(argumentos['primeiroCandidato'] as Map);
    final Map<String, dynamic> segundoCandidato =
        Map<String, dynamic>.from(argumentos['segundoCandidato'] as Map);

    // Recupera o mapa de indicadores do primeiro candidato.
    final Map<String, dynamic> indicesPrimeiro =
        converterIndices(primeiroCandidato['indices']);
    final Map<String, dynamic> indicesSegundo =
        converterIndices(segundoCandidato['indices']);

    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: true),
      child: Scaffold(
        backgroundColor: _fundo,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double espacamentoLateral =
                  constraints.maxWidth < 370 ? 16 : 22;

              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        espacamentoLateral,
                        18,
                        espacamentoLateral,
                        32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ //botão que retorna para comparacao.dart
                          IconButton.filledTonal(
                            tooltip: 'Voltar para comparação',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: _azulPrincipal,
                              minimumSize: const Size(46, 46),
                            ),
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                          const SizedBox(height: 20),
                          const Text( //h1
                            'Comparação',
                            style: TextStyle(
                              color: _azulPrincipal,
                              fontSize: 29,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.7,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text( //h2
                            'Compare os candidatos e descubra em quais '
                            'áreas cada um apresenta maior quantidade '
                            'de propostas.',
                            style: TextStyle(
                              color: _textoSecundario,
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 24), //card com info dos candidatos
                          _cardResumoCandidatos(
                            primeiroCandidato: primeiroCandidato,
                            segundoCandidato: segundoCandidato,
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            'Propostas por tema',
                            style: TextStyle(
                              color: _azulPrincipal,
                              fontSize: 21,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Compare os percentuais apresentados por cada candidato.',
                            style: TextStyle(
                              color: _textoSecundario,
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 18),
                          ..._temas.map( //percorre pelos temas e cria um card de comparação para cada um
                            (tema) {
                              final int valorPrimeiro =
                                  converterParaInteiro(indicesPrimeiro[tema]);
                              final int valorSegundo =
                                  converterParaInteiro(indicesSegundo[tema]);

                              return cardTema(
                                tema: tema,
                                nomePrimeiro: primeiroCandidato['nome']
                                        ?.toString() ??
                                    'Primeiro candidato',
                                valorPrimeiro: valorPrimeiro,
                                nomeSegundo: segundoCandidato['nome']
                                        ?.toString() ??
                                    'Segundo candidato',
                                valorSegundo: valorSegundo,
                              );
                            },
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF2EF),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFD4E8DE),
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: corPrimeiroCandidato,
                                  size: 22,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Os percentuais apresentados são dados demonstrativos. '
                                    'A distribuição das propostas por tema precisa de uma '
                                    'metodologia e fontes verificáveis. Os valores não '
                                    'representam uma avaliação da qualidade dos candidatos.',
                                    style: TextStyle(
                                      color: _azulPrincipal,
                                      fontSize: 12,
                                      height: 1.55,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox( //btn para voltar e selecionar outros dois candidatos
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RotasApp.comparacao,
                                );
                              },
                              icon: const Icon(Icons.compare_arrows_rounded),
                              label: const Text(
                                'Fazer outra comparação',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: corPrimeiroCandidato,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: NavigationBar( //barra inferior
          selectedIndex: 1,
          onDestinationSelected: (indice) { //navegação ao clicar em um item da barra inferior
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
          height: 74,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          indicatorColor: const Color(0xFFE8F5EF),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded, color: corPrimeiroCandidato),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline_rounded),
              selectedIcon: Icon(Icons.people_rounded, color: corPrimeiroCandidato),
              label: 'Candidatos',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book_rounded, color: corPrimeiroCandidato),
              label: 'Dicionário',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded, color: corPrimeiroCandidato),
              label: 'Meu Perfil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardResumoCandidatos({
    required Map<String, dynamic> primeiroCandidato,
    required Map<String, dynamic> segundoCandidato,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _borda),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( //primeiro eleitor selecionado
                child: candidatoComparado(
                  nome: primeiroCandidato['nome']?.toString() ?? 'Candidato',
                  partido: primeiroCandidato['partido']?.toString() ?? '',
                  foto: primeiroCandidato['foto']?.toString() ?? '',
                  cor: corPrimeiroCandidato,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, left: 5, right: 5),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: _fundo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'VS',
                    style: TextStyle(
                      color: _azulPrincipal,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Expanded( //segundo eleitor selecionado
                child: candidatoComparado(
                  nome: segundoCandidato['nome']?.toString() ?? 'Candidato',
                  partido: segundoCandidato['partido']?.toString() ?? '',
                  foto: segundoCandidato['foto']?.toString() ?? '',
                  cor: corSegundoCandidato,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(color: _borda),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 14,
            runSpacing: 10,
            children: [
              itemLegenda(
                nome: primeiroCandidato['nome']?.toString() ?? 'Primeiro candidato',
                cor: corPrimeiroCandidato,
              ),
              itemLegenda(
                nome: segundoCandidato['nome']?.toString() ?? 'Segundo candidato',
                cor: corSegundoCandidato,
              ),
            ],
          ),
        ],
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
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: cor, width: 2.5),
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
        const SizedBox(height: 12),
        Text(
          nome,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: _azulPrincipal,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
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
    );
  }

  Widget imagemPadraoCandidato() {
    return Container(
      width: 86,
      height: 86,
      color: const Color(0xFFE8EEF6),
      child: const Icon(
        Icons.person_outline_rounded,
        color: _azulPrincipal,
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
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 7),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 190),
          child: Text(
            nome,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _azulPrincipal,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
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
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borda),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text( //nome do tema
            tema,
            style: const TextStyle(
              color: _azulPrincipal,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 17),
          barraCandidato( //barra primeiro candidato
            nome: nomePrimeiro,
            valor: valorPrimeiro,
            cor: corPrimeiroCandidato,
          ),
          const SizedBox(height: 16),
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
    final Color corTexto = cor == corSegundoCandidato ? _amareloEscuro : cor;

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Expanded( //nome candidato
              child: Text(
                nome,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: _azulPrincipal,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text( //percentual do candidato
              '$valorSeguro%',
              style: TextStyle(
                color: corTexto,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        LayoutBuilder(
          builder: (context, constraints) {
            final double larguraPreenchida = constraints.maxWidth * (valorSeguro / 100); //cálculo do preenchimento da barra
            return Semantics(
              label: '$nome: $valorSeguro por cento',
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EDF2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutCubic,
                    width: larguraPreenchida,
                    height: 10,
                    decoration: BoxDecoration(
                      color: cor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Map<String, dynamic> converterIndices(dynamic indices) {
    if (indices is Map) {
      return {
        for (final entry in indices.entries)
          entry.key.toString(): entry.value,
      };
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
    return Theme(
      data: Theme.of(context).copyWith(useMaterial3: true),
      child: Scaffold(
        backgroundColor: _fundo,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF2DE),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        size: 48,
                        color: _amareloEscuro,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'Não foi possível exibir o resultado',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _azulPrincipal,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      mensagem,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: _textoSecundario,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
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
                          backgroundColor: corPrimeiroCandidato,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Voltar para comparação',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
