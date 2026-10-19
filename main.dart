import 'package:flutter/material.dart';

import 'core/rotas/rotas.dart';
import 'core/tema/temas.dart';

import 'screens/splash/splash.dart'; //feito
import 'screens/login/login.dart'; //feito
import 'screens/interesses/interesses.dart'; //feito
import 'screens/home/home.dart'; //feito
import 'screens/candidatos/candidatos.dart'; //feito
import 'screens/comparacao/comparacao.dart'; //feito
import 'screens/resultado/resultado.dart'; //feito
import 'screens/dicionario/dicionario.dart'; // FAZER
import 'screens/perfil/perfil.dart'; // FAZER
import 'core/tema/controlador_temas.dart'; //modo noturno, fazer na parte perfil.dart

void main() {
  runApp(const Aplicacao());
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //esconder a faixa de debug no canto superior direito
      title: 'Voto Consciente',
      theme: TemaApp.claro,
      initialRoute: RotasApp.splash, //rota inicial
      routes: {
        RotasApp.splash: (_) =>
            const TelaSplash(),
        RotasApp.login: (_) =>
            const TelaLogin(),
        RotasApp.interesses: (_) =>
            const TelaInteresses(),
        RotasApp.home: (_) =>
            const TelaHome(),
        RotasApp.candidatos: (_) =>
            const TelaCandidatos(),
        RotasApp.comparacao: (_) =>
            const TelaComparacao(),
        RotasApp.resultado: (_) =>
            const TelaResultado(),
        RotasApp.dicionario: (_) =>
            const TelaDicionario(),
        RotasApp.perfil: (_) =>
            const TelaPerfil(),
      },
    );
  }
}