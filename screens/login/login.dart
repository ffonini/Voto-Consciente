
import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController = TextEditingController(); //controla o campo de email
  final TextEditingController senhaController = TextEditingController(); //controla o campo de senha 

  bool _mostrarSenha = false;

  static const Color _azulPrincipal = Color(0xFF1F3A5F);
  static const Color _azulCampo = Color(0xFF2B4B70);
  static const Color _verdePrincipal = Color(0xFF087F5B);
  static const Color _amarelo = Color(0xFFE9B949);

  InputDecoration _decoracaoCampo({
    required String titulo,
    required String dica,
    required IconData icone,
    Widget? sufixo,
  }) {
    return InputDecoration(
      labelText: titulo,
      hintText: dica,
      labelStyle: const TextStyle(
        color: Color(0xFFD5DFEB),
        fontSize: 14,
      ),
      floatingLabelStyle: const TextStyle(
        color: _amarelo,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFFB4C3D5),
        fontSize: 14,
      ),
      prefixIcon: Icon(
        icone,
        color: const Color(0xFFD5DFEB),
        size: 21,
      ),
      suffixIcon: sufixo,
      filled: true,
      fillColor: _azulCampo,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 19,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xFF466586),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: _amarelo,
          width: 1.5,
        ),
      ),
    );
  }

  void _entrar() {
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) { //verifica se tem campos vazios
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha todos os campos."),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!email.contains("@")) { //verifica sde o email é válido pelo @
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Digite um e-mail válido."),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.pushNamed( //se tiver tudo certo, direciona para a tela de interesses
      context,
      RotasApp.interesses,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _azulPrincipal,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 440,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric( //espaçamento lateral
                        horizontal: 28,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 32),

                          // Identidade visual
                          Center(
                            child: Container(
                              width: 112,
                              height: 112,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(
                                      alpha: 0.12,
                                    ),
                                    blurRadius: 24,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(21),
                                child: Image.asset(
                                  "assets/img/logo.jpg",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          const Text(
                            "Voto Consciente",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.7,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Informação para escolhas conscientes.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFCED9E7),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 48),

                          const Text(
                            "Seja bem-vindo!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.5,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Acesse sua conta para definir suas preferências",
                            style: TextStyle(
                              color: Color(0xFFCED9E7),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(height: 30), //campo de email

                          TextField(
                            controller: emailController,
                            keyboardType:
                                TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [
                              AutofillHints.email,
                            ],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            cursorColor: _amarelo,
                            decoration: _decoracaoCampo(
                              titulo: "E-mail",
                              dica: "Digite seu e-mail",
                              icone: Icons.mail_outline_rounded,
                            ),
                          ),

                          const SizedBox(height: 18), //campo de senha

                          TextField(
                            controller: senhaController,
                            obscureText: !_mostrarSenha,
                            keyboardType:
                                TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _entrar(),
                            autofillHints: const [
                              AutofillHints.password,
                            ],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            cursorColor: _amarelo,
                            decoration: _decoracaoCampo(
                              titulo: "Senha",
                              dica: "Digite sua senha",
                              icone: Icons.lock_outline_rounded,
                              sufixo: IconButton(
                                tooltip: _mostrarSenha
                                    ? "Ocultar senha"
                                    : "Mostrar senha",
                                onPressed: () {
                                  setState(() {
                                    _mostrarSenha = !_mostrarSenha;
                                  });
                                },
                                icon: Icon(
                                  _mostrarSenha
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: const Color(0xFFD5DFEB),
                                  size: 21,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30), //botão entrar

                          SizedBox(
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _entrar,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _verdePrincipal,
                                foregroundColor: Colors.white,
                                elevation: 2,
                                shadowColor: Colors.black26,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Entrar",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
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
  void dispose() { //liberar os recursos usados
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}
