import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String email; // variable que recibe el correo del usuario

  const WelcomeScreen({
    super.key,
    required this.email,
  }); // El constructor necesita un email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Parte principal de la pantalla
      body: Container(
        // Añade estilos
        decoration: const BoxDecoration(
          // Hace un degradado de colores
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 34, 228, 172),
              Color.fromARGB(255, 8, 179, 229),
            ],
          ),
        ),
        // Evita que el contenido quede en la barra de notificaciones
        child: SafeArea(
          child: Center(
            child: Column(
              // Centra en el eje vertical
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texto de bienvenida con correo del usuario
                Text(
                  "Bienvenido, usted ha ingresado con el correo $email",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
