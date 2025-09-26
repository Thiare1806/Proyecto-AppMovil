import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/welcome_screen.dart';

class LoginField extends StatefulWidget {
  const LoginField({super.key});

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  // Para validar el formulario
  final _formKey = GlobalKey<FormState>();
  // Controladores que guarda lo que se escribe
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  // Variables para mostrar/ocultar contraseña y estado de carga
  bool _obscure = true;
  bool _loading = false;
  // Guarda el mensaje de error cuando hay uno
  String? _error;

  @override
  // Para liberar recursos
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  // Función para cuando se presiona el boton "Iniciar sesión"
  Future<void> _submit() async {
    // Esconde el teclado
    FocusScope.of(context).unfocus();
    // Valida los campos del formulario
    final ok = _formKey.currentState?.validate() ?? false;
    if (!ok) return;
    setState(() {
      _loading = true; // Cambia el estado a cargando
      _error = null;
    });

    try {
      // Simula una espera de 3 segundos
      await Future.delayed(const Duration(milliseconds: 3000));
      // Si no hay errores
      if (!mounted) return;
      // Muestra la pantalla de bienvenida
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              WelcomeScreen(email: _emailCtrl.text.trim()), // Se lleva el email
        ),
      );
    } catch (e) {
      // Si hay errores muestra los mensaje
      if (!mounted) return;
      setState(() => _error = "Credenciales invalidas o error de red");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se pudo iniciar sesión")),
      );
      // En ambos caso se quita el estado de cargando
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      // Formulario para validar los campos juntos
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Container(
          padding: const EdgeInsets.all(25), // borde interno
          decoration: BoxDecoration(
            color: Colors.white, // color de fondo
            borderRadius: BorderRadius.circular(15), // redondea bordes
          ),

          // Para organizar verticalmente
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo de la app
              Image.network(
                "https://i.ibb.co/TBLYX1Ts/Gemini-Generated-Image-on0pmton0pmton0p-1.png",
                height: 80,
              ),
              const SizedBox(height: 20),
              // Icono de persona
              Center(child: Icon(Icons.person, size: 100)),

              const SizedBox(height: 4),
              // Titulo de la pantalla
              const Text(
                "Iniciar sesión",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),
              // Campo del correo electrónico
              TextFormField(
                enabled: !_loading, //deshabilita el campo si esta cargando
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                enableSuggestions: false,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(
                  labelText: "Correo electrónico", // nombre del campo
                  hintText: "tucorreo@ejemplo.cl", // ejemplo de correo
                  prefixIcon: Icon(Icons.email_rounded),
                  border: OutlineInputBorder(), // borde del campo
                ),
                // Valida el correo electrónico
                validator: (email) {
                  final value = email?.trim() ?? '';
                  if (value.isEmpty)
                    return "Ingrese su correo electrónico"; // si esta vacio muestra este mensaje
                  final emailOk = RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(value);
                  return emailOk
                      ? null
                      : "El correo electrónico es invalido."; // si no cumple muestra este mensaje
                },

                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),

              const SizedBox(height: 16),

              // Campo de la contraseña
              TextFormField(
                enabled: !_loading, // dehabilita el campo si se esta cargando
                controller: _passCtrl,
                obscureText: _obscure, // oculta/muestra la contraseña
                enableSuggestions: false,
                autocorrect: false,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  labelText: "Contraseña", // nombre del campo
                  hintText: "******",
                  border: const OutlineInputBorder(), // borde del campo
                  prefixIcon: Icon(Icons.lock_rounded),
                  // Icono para mostrar/ocultar contraseña
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                    tooltip: _obscure ? "Mostrar" : "Ocultar",
                  ),
                ),
                // Valida la contraseña
                validator: (pass) {
                  // Verifica si está vacia
                  if (pass == null || pass.isEmpty)
                    return "Ingrese su contraseña.";
                  // Verifica que tenga mas de 6 caracteres
                  if (pass.length < 6) return "Minimo 6 caracteres.";
                  return null;
                },

                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
              ),

              const SizedBox(height: 8),
              // Si hay error muestra el mensaje
              if (_error != null)
                Text(
                  _error!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),

              SizedBox(height: 16),

              SizedBox(
                height: 48,
                // Botón para iniciar sesion
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 34, 228, 172),
                    foregroundColor: Colors.white,
                  ),
                  // Cuando se presiona llama la funcion _submit
                  onPressed: _loading ? null : _submit,
                  child: _loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          // Rueda de carga
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Text("Iniciar sesión"), // texto del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
