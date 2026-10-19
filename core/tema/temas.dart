import 'package:flutter/material.dart';
import 'cores.dart';

class TemaApp {
    static ThemeData claro = ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            CoresApp.fundo,
        colorScheme:
            ColorScheme.fromSeed(
                seedColor: CoresApp.verde,
            ),
        ThemeData: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: CoresApp.texto,
            );
            titleLarge: TextStyle(
                fontSize: 22;
                fontWeight: FontWeight.bold
            ),
            bodyLarge: TextStyle(
                fontSize: 16.
            );
        )
    )
}