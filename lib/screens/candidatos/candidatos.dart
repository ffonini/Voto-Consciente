import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaCandidatos extends StatelessWidget {
  const TelaCandidatos({super.key});

  static const Color _azul = Color(0xFF1F3A5F);
  static const Color _verde = Color(0xFF087F5B);
  static const Color _amarelo = Color(0xFFE9B949);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _textoSecundario = Color(0xFF64748B);

  static const List<Map<String, dynamic>> _candidatos = [
    {
      'nome': 'Lula',
      'partido': 'Partido PT',
      'foto': 'assets/img/lula.png',
      'patrimonio': 'Consulte a fonte oficial',
      'indices': <String, int>{
        'Saúde': 70, 'Educação': 82, 'Segurança': 55,
        'Transporte': 64, 'Emprego': 76, 'Meio ambiente': 68,
        'Combate à corrupção': 58, 'Moradia': 73,
      },
    },
    {
      'nome': 'Flávio Bolsonaro',
      'partido': 'Partido PL',
      'foto': 'assets/img/bolsonaro.png',
      'patrimonio': 'Consulte a fonte oficial',
      'indices': <String, int>{
        'Saúde': 61, 'Educação': 54, 'Segurança': 85,
        'Transporte': 57, 'Emprego': 72, 'Meio ambiente': 48,
        'Combate à corrupção': 62, 'Moradia': 51,
      },
    },
    {
      'nome': 'Renan Santos',
      'partido': 'Partido Missão',
      'foto': 'assets/img/renan.png',
      'patrimonio': 'Consulte a fonte oficial',
      'indices': <String, int>{
        'Saúde': 57, 'Educação': 71, 'Segurança': 74,
        'Transporte': 50, 'Emprego': 80, 'Meio ambiente': 53,
        'Combate à corrupção': 84, 'Moradia': 49,
      },
    },
    {
      'nome': 'Augusto Cury',
      'partido': 'Partido Avante',
      'foto': 'assets/img/cury.png',
      'patrimonio': 'Consulte a fonte oficial',
      'indices': <String, int>{
        'Saúde': 74, 'Educação': 89, 'Segurança': 51,
        'Transporte': 45, 'Emprego': 63, 'Meio ambiente': 59,
        'Combate à corrupção': 60, 'Moradia': 55,
      },
    },
    {
      'nome': 'Ronaldo Caiado',
      'partido': 'Partido PSD',
      'foto': 'assets/img/caiado.png',
      'patrimonio': 'Consulte a fonte oficial',
      'indices': <String, int>{
        'Saúde': 81, 'Educação': 60, 'Segurança': 79,
        'Transporte': 58, 'Emprego': 70, 'Meio ambiente': 56,
        'Combate à corrupção': 65, 'Moradia': 52,
      },
    },
    {
      'nome': 'Romeu Zema',
      'partido': 'Partido Novo',
      'foto': 'assets/img/zema.png',
      'patrimonio': 'Consulte a fonte oficial',
      'indices': <String, int>{
        'Saúde': 62, 'Educação': 67, 'Segurança': 71,
        'Transporte': 69, 'Emprego': 86, 'Meio ambiente': 54,
        'Combate à corrupção': 78, 'Moradia': 48,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'EXPLORAR',
                    style: TextStyle(
                      color: _verde, fontSize: 12,
                      fontWeight: FontWeight.w800, letterSpacing: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Candidatos',
                    style: TextStyle(
                      color: _azul, fontSize: 30,
                      fontWeight: FontWeight.w800, letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Conheça os candidatos à\npresidência',
                    style: TextStyle(
                      color: _textoSecundario, fontSize: 15, height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row( //botão de comparar
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () { //direciomaneto pra tela comparacao.dart
                          Navigator.pushNamed(context, RotasApp.comparacao);
                        },
                        icon: const Icon(Icons.compare_arrows_rounded, size: 20),
                        label: const Text('Comparar candidatos'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _verde,
                          side: const BorderSide(color: _verde),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 18),
                      itemCount: _candidatos.length,
                      itemBuilder: (context, index) {
                        final candidato = _candidatos[index];
                        return cardCandidato(
                          context: context,
                          nome: candidato['nome'] as String,
                          partido: candidato['partido'] as String,
                          foto: candidato['foto'] as String,
                          patrimonio: candidato['patrimonio'] as String,
                          indices: candidato['indices'] as Map<String, int>,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar( //barra inferior
        selectedIndex: 1,
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE8F5EF),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: _verde),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_rounded, color: _verde),
            label: 'Candidatos',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded, color: _verde),
            label: 'Dicionário',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded, color: _verde),
            label: 'Meu Perfil',
          ),
        ],
        onDestinationSelected: (indice) { //direciona pra home
          if (indice == 0) {
            Navigator.pushReplacementNamed(context, RotasApp.home);
          }
          if (indice == 1) return;
          if (indice == 2) { //direciona pro dicionario
            Navigator.pushReplacementNamed(context, RotasApp.dicionario);
          }
          if (indice == 3) { //direciona pro perfil
            Navigator.pushReplacementNamed(context, RotasApp.perfil);
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        child: InkWell( //permite abrir o card inteiro
          borderRadius: BorderRadius.circular(18),
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
            constraints: const BoxConstraints(minHeight: 86),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE6EBF1)),
            ),
            child: Row(
              children: [
                _fotoCandidato(foto, 25),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nome,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _azul, fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        partido,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _textoSecundario, fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.chevron_right_rounded, //seta é só charme, o card em si já esta interativo
                  color: _verde,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fotoCandidato(String foto, double raio) {
    return CircleAvatar(
      radius: raio,
      backgroundColor: const Color(0xFFE8EEF6),
      child: ClipOval(
        child: Image.asset(
          foto,
          width: raio * 2,
          height: raio * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.person_outline_rounded,
            color: _azul,
            size: raio,
          ),
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
    showDialog<void>(
      context: context,
      barrierDismissible: true, //permite fechar clicando fora do card
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: _fundo,
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 520,
              maxHeight: MediaQuery.sizeOf(context).height * 0.88,
            ),
            child: SingleChildScrollView( //libera scroll
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align( //x no canto superiro direito dos cards individuais
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      tooltip: 'Fechar',
                      onPressed: () {
                        Navigator.pop(context); //fecha dialog e volta pro candidatos.dart
                      },
                      icon: const Icon(Icons.close_rounded, color: _azul),
                    ),
                  ),
                  Center( //imagem
                    child: _fotoCandidato(foto, 57),
                  ),
                  const SizedBox(height: 16),
                  Center( //nome 
                    child: Text(
                      nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: _azul, fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center( //partido 
                    child: Text(
                      partido,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: _verde, fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container( //patrimônio
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      border: Border.all(color: const Color(0xFFE6EBF1)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF7DF),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Color(0xFF9A761D), size: 26,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Patrimônio declarado',
                                style: TextStyle(
                                  color: _textoSecundario, fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                patrimonio,
                                style: const TextStyle(
                                  color: _azul, fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Distribuição das propostas por tema',
                    style: TextStyle(
                      color: _azul, fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dados demonstrativos, sem avaliação oficial.',
                    style: TextStyle(color: _textoSecundario, fontSize: 12),
                  ),
                  const SizedBox(height: 18),
                  ...indices.entries.map( //gera uma barra para cada item do map
                    (item) => indicadorTema(
                      tema: item.key,
                      porcentagem: item.value,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      label: const Text('Voltar aos candidatos'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _verde,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
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
      padding: const EdgeInsets.only(bottom: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row( //linha com o tema e percentual
            children: [
              Expanded(
                child: Text(
                  tema,
                  style: const TextStyle(
                    color: _azul, fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$porcentagem%',
                style: const TextStyle(
                  color: _verde, fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          ClipRRect( //barra horizontal que representa o percentual
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator( //trabalha de 0 a 1, com isso, /100 para a %
              value: porcentagem / 100,
              minHeight: 9,
              backgroundColor: const Color(0xFFE5EBF0),
              valueColor: const AlwaysStoppedAnimation<Color>(_verde),
            ),
          ),
        ],
      ),
    );
  }
}
