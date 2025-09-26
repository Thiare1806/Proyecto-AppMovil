import 'package:proyecto_appmovil/login_fields.dart';
import 'package:flutter/material.dart';

// Pantalla para iniciar sesión
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cuerpo principal de la pantalla
      body: Container(
        // Añade estilos al contenedor
        decoration: const BoxDecoration(
          // Hace degradado de colores
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Los colores para el dagradado
            colors: [
              Color.fromARGB(255, 34, 228, 172),
              Color.fromARGB(255, 8, 179, 229),
            ],
          ),
        ),
        // El contenido que se muestra
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                // El maximo de ancho del contenido
                constraints: const BoxConstraints(maxWidth: 420),
                child:
                    LoginField(), // Widget que tiene los campos de inicio de sesión
              ),
            ),
          ),
        ),
      ),
    );
  }
}
