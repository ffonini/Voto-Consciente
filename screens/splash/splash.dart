import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/rotas/rotas.dart';
import '../../core/tema/cores.dart';

class TelaSplash extends StatefulWidget {
    const TelaSplash({super.key});
    @override
    State<TelaSplash> createState() =>
        _TelaSplashState();
}

class _TelaSplashState
    extends State<TelaSplash> {
        @override
        void initState() {
            super.initState();
            Timer( //temporizador
                const Duration(seconds: 3), //aguardar 3 segundos
                (){
                    Navigator.pushReplacementNamed( //direciona para a tela de login
                        context, RotasApp.login,
                    )
                }
            )
        }
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                backgroundColor: CoresApp.azul,
                body: Center(
                    child: Image.asset( //inserção da logo
                        "assets/img/logo.jpg",
                        width: 170,
                    )
                )
            )
        }
    }