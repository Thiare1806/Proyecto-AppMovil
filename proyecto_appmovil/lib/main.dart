// main
import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/splash_screen.dart';

// Función principal para iniciar la app
void main() {
  runApp(const MainApp());
}

// Widget principal
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-Do app", // Titulo de la app
      theme: ThemeData(
        // Tema visual de la app
        useMaterial3: true,
        colorSchemeSeed: Colors.tealAccent[400],
      ),
      home: const SplashScreen(), // Es la primera pantalla que se muestra
    );
  }
}
