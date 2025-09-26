// splash screen
import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/login_screen.dart'; // Importamos la pantalla a la que navegaremos

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(); // función que al cargar muestra el login
  }

  // Espera 6 segundos y luego muestra el login
  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(milliseconds: 6000));

    if (!mounted) return;
    // Muestra la pantalla del login
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Degradado de color al fondo de pantalla
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF22E4AC), Color(0xFF08B3E5)],
          ),
        ),
        // Se centran todos los elementos
        child: Center(
          // Organiza los elementos verticalmente
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Muestra el icono de la app
              Image.network(
                "https://i.ibb.co/bMntyXb6/Icon-to-do.png",
                height: 200,
              ),
              SizedBox(height: 20),
              // Muestra la rueda de carga
              CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 16),
              // Muestra el texto Cargando
              Text(
                "Cargando...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
