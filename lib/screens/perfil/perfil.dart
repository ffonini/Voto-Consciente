import 'package:flutter/material.dart';

import '../../core/rotas/rotas.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  static const Color _azul = Color(0xFF1F3A5F);
  static const Color _verde = Color(0xFF087F5B);
  static const Color _amarelo = Color(0xFFE9B949);
  static const Color _fundo = Color(0xFFF7F9FC);
  static const Color _textoSecundario = Color(0xFF64748B);
  static const Color _vermelho = Color(0xFFD64545);

  // dados demonstrativos do usuário
  static const String _nome = 'Elton Souza';
  static const String _email = 'elton.souza@exemplo.com.br';
  static const String _foto = 'assets/img/perfil.png';

  // todos os temas que o usuário pode escolher
  static const Map<String, IconData> _todosTemas = {
    'Enchentes': Icons.water_drop_outlined,
    'Emprego': Icons.work_outline_rounded,
    'Desinformação': Icons.campaign_outlined,
    'Saúde': Icons.favorite_border_rounded,
    'Educação': Icons.school_outlined,
    'Segurança': Icons.shield_outlined,
    'Transporte': Icons.directions_bus_outlined,
    'Meio ambiente': Icons.eco_outlined,
    'Combate à corrupção': Icons.gavel_rounded,
    'Moradia': Icons.home_outlined,
  };

  // temas favoritos atuais (estado da tela)
  List<String> _favoritos = ['Enchentes', 'Emprego', 'Desinformação', 'Saúde'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CONTA',
                    style: TextStyle(
                      color: _verde,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Meu Perfil',
                    style: TextStyle(
                      color: _azul,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _cardUsuario(),
                  const SizedBox(height: 14),
                  _cardTemasFavoritos(),
                  const SizedBox(height: 14),
                  _cardOpcoes(),
                  const SizedBox(height: 14),
                  _botaoSair(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        // barra inferior
        selectedIndex: 3,
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
          if (indice == 3) return;
        },
      ),
    );
  }

  // ---------- Cards ----------

  BoxDecoration _decoracaoCard() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFE6EBF1)),
    );
  }

  Widget _cardUsuario() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _decoracaoCard(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xFFE8EEF6),
            child: ClipOval(
              child: Image.asset(
                _foto,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.person_outline_rounded,
                  color: _azul,
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _nome,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _azul,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  _email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: _textoSecundario, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTemasFavoritos() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _decoracaoCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TEMAS FAVORITOS',
            style: TextStyle(
              color: _azul,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Seus tópicos de maior interesse no app',
            style: TextStyle(color: _textoSecundario, fontSize: 13),
          ),
          const SizedBox(height: 16),
          if (_favoritos.isEmpty)
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Você ainda não escolheu nenhum tema.',
                style: TextStyle(color: _textoSecundario, fontSize: 13),
              ),
            )
          else
            Wrap(
              // chips alternando verde e azul
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < _favoritos.length; i++)
                  _chipTema(_favoritos[i], i.isEven ? _verde : _azul),
              ],
            ),
          const SizedBox(height: 14),
          _botaoEditarPrioridades(),
        ],
      ),
    );
  }

  Widget _chipTema(String tema, Color cor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _todosTemas[tema] ?? Icons.label_outline,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 7),
          Text(
            tema,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoEditarPrioridades() {
    return CustomPaint(
      painter: _BordaTracejada(cor: _amarelo, raio: 12),
      child: Material(
        color: const Color(0xFFFFFBEF),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _editarPrioridades,
          child: const SizedBox(
            width: double.infinity,
            height: 46,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_rounded, color: Color(0xFF9A761D), size: 20),
                SizedBox(width: 6),
                Text(
                  'Editar prioridades',
                  style: TextStyle(
                    color: Color(0xFF9A761D),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardOpcoes() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: _decoracaoCard(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 4),
            child: Text(
              'OPÇÕES',
              style: TextStyle(
                color: _azul,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
          ),
          _itemOpcao(
            icone: Icons.nights_stay_outlined,
            titulo: 'Modo Noturno',
            subtitulo: 'Gerenciar alertas e novidades',
            onTap: () => _avisoEmBreve('Modo noturno'),
          ),
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Color(0xFFE6EBF1),
          ),
          _itemOpcao(
            icone: Icons.edit_outlined,
            titulo: 'Editar Perfil',
            subtitulo: 'Alterar seu nome, e-mail ou senha',
            onTap: () => _avisoEmBreve('Editar perfil'),
          ),
        ],
      ),
    );
  }

  Widget _itemOpcao({
    required IconData icone,
    required String titulo,
    required String subtitulo,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEF6),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icone, color: _azul, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: _azul,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      color: _textoSecundario,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: _verde, size: 25),
          ],
        ),
      ),
    );
  }

  Widget _botaoSair() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: _confirmarSaida,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE6EBF1)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDECEC),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: _vermelho,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                'Sair da conta',
                style: TextStyle(
                  color: _vermelho,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Ações ----------

  void _avisoEmBreve(String recurso) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$recurso: em breve'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _azul,
      ),
    );
  }

  void _confirmarSaida() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: _fundo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text(
            'Sair da conta?',
            style: TextStyle(color: _azul, fontWeight: FontWeight.w800),
          ),
          content: const Text(
            'Você precisará entrar novamente para acessar seu perfil.',
            style: TextStyle(color: _textoSecundario),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: _textoSecundario),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: troque RotasApp.home pela rota de login, se existir
                Navigator.pushNamedAndRemoveUntil(
                  this.context,
                  RotasApp.login,
                  (rota) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _vermelho,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Sair'),
            ),
          ],
        );
      },
    );
  }

  void _editarPrioridades() {
    // cópia local: só vale se o usuário tocar em "Salvar"
    final selecionados = Set<String>.from(_favoritos);

    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          tooltip: 'Fechar',
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close_rounded, color: _azul),
                        ),
                      ),
                      const Text(
                        'Editar prioridades',
                        style: TextStyle(
                          color: _azul,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Escolha os temas que mais importam para você.',
                        style: TextStyle(color: _textoSecundario, fontSize: 13),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _todosTemas.entries.map((tema) {
                          final ativo = selecionados.contains(tema.key);
                          return FilterChip(
                            avatar: Icon(
                              tema.value,
                              size: 18,
                              color: ativo ? Colors.white : _verde,
                            ),
                            label: Text(tema.key),
                            selected: ativo,
                            showCheckmark: false,
                            labelStyle: TextStyle(
                              color: ativo ? Colors.white : _azul,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                            backgroundColor: Colors.white,
                            selectedColor: _verde,
                            side: BorderSide(
                              color: ativo ? _verde : const Color(0xFFE6EBF1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            onSelected: (valor) {
                              setDialogState(() {
                                if (valor) {
                                  selecionados.add(tema.key);
                                } else {
                                  selecionados.remove(tema.key);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              // mantém a ordem original da lista de temas
                              _favoritos = _todosTemas.keys
                                  .where(selecionados.contains)
                                  .toList();
                            });
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.check_rounded),
                          label: const Text('Salvar'),
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
      },
    );
  }
}

// Desenha a borda tracejada do botão "Editar prioridades"
class _BordaTracejada extends CustomPainter {
  final Color cor;
  final double raio;

  _BordaTracejada({required this.cor, required this.raio});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = cor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final caminho = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(raio)),
      );

    const tracoLargura = 6.0;
    const espaco = 4.0;

    for (final metrica in caminho.computeMetrics()) {
      double distancia = 0;
      while (distancia < metrica.length) {
        final fim = (distancia + tracoLargura).clamp(0.0, metrica.length);
        canvas.drawPath(metrica.extractPath(distancia, fim), paint);
        distancia += tracoLargura + espaco;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _BordaTracejada antigo) =>
      antigo.cor != cor || antigo.raio != raio;
}
