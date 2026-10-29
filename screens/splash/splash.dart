
import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';
import '../../core/tema/cores.dart';

class TelaSplash extends StatefulWidget {
  const TelaSplash({super.key});

  @override
  State<TelaSplash> createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controladorAnimacao;
  late final Animation<double> _opacidade;
  late final Animation<double> _escala;
  late final Animation<Offset> _deslocamento;
  late final Timer _temporizador;

  static const Color _amarelo = Color(0xFFE9B949);

  @override
  void initState() {
    super.initState();

    // Controla todas as animações da Splash Screen
    _controladorAnimacao = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Faz os elementos aparecerem gradualmente
    _opacidade = CurvedAnimation(
      parent: _controladorAnimacao,
      curve: const Interval(
        0.0,
        0.55,
        curve: Curves.easeInOut,
      ),
    );

    // Aplica um zoom suave na identidade visual
    _escala = Tween<double>(
      begin: 0.88,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controladorAnimacao,
        curve: const Interval(
          0.0,
          0.65,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    // Move o conteúdo suavemente de baixo para cima
    _deslocamento = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controladorAnimacao,
        curve: const Interval(
          0.05,
          0.65,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    _controladorAnimacao.forward();

    _temporizador = Timer( //temporizador
      const Duration(seconds: 3), //aguardar 3 segundos
      () {
        if (!mounted) return;

        Navigator.pushReplacementNamed( //direciona para a tela de login
          context,
          RotasApp.login,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoresApp.azul,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 28,
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 28),

                      // Identidade visual animada
                      FadeTransition(
                        opacity: _opacidade,
                        child: SlideTransition(
                          position: _deslocamento,
                          child: ScaleTransition(
                            scale: _escala,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 154,
                                  height: 154,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(30),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 28,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(22),
                                    child: Image.asset( //inserção da logo
                                      "assets/img/logo.jpg",
                                      width: 134,
                                      height: 134,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 30),

                                const Text(
                                  "Voto Consciente",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: -0.6,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Container(
                                  width: 46,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: _amarelo,
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Indicador de carregamento animado
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 210,
                            child: AnimatedBuilder(
                              animation: _controladorAnimacao,
                              builder: (context, child) {
                                return ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    value: _controladorAnimacao.value,
                                    minHeight: 4,
                                    backgroundColor:
                                        const Color(0xFF526B89),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      _amarelo,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            "Preparando sua experiência...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFD5DFEB),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _temporizador.cancel();
    _controladorAnimacao.dispose();
    super.dispose();
  }
}
