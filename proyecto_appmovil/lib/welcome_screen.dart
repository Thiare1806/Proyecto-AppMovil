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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 34, 228, 172),
              Color.fromARGB(255, 8, 179, 229),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
