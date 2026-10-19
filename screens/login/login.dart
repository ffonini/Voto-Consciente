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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF243B6A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric( //espaçamento lateral
              horizontal: 32,
            ),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  "assets/img/logo.jpg",
                  width: 120,
                ),
                const SizedBox(height: 25),
                const Text(
                  "Voto Consciente",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Acesse sua conta para definir suas preferências",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 30), //campo de email
                TextField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Seu email",
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    filled: true,
                    fillColor:
                        const Color(0xFF304A7C),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20), //campo de senha
                TextField(
                  controller: senhaController,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Sua senha",
                    hintStyle: const TextStyle(
                      color: Colors.white54,
                    ),
                    filled: true,
                    fillColor:
                        const Color(0xFF304A7C),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30), //botão entrar
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF4B8D63),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: () {
                      final email = emailController
                          .text
                          .trim();
                      final senha = senhaController
                          .text
                          .trim();
                      if (email.isEmpty || senha.isEmpty) { //verifica se tem campos vazios
                        ScaffoldMessenger.of(context,).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Preencha todos os campos.",
                            ),
                            backgroundColor:
                                Colors.red,
                          ),
                        );
                        return;
                      }
                      if (!email.contains("@")) { //verifica sde o email é válido pelo @
                        ScaffoldMessenger.of(context,).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Digite um e-mail válido.",
                            ),
                            backgroundColor:
                                Colors.orange,
                          ),
                        );
                        return;
                      }
                      Navigator.pushNamed( //se tiver tudo certo, direciona para a tela de interesses
                        context,
                        RotasApp.interesses,
                      );
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
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