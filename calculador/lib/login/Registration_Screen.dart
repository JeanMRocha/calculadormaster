import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('E-mail não cadastrado.'),
            const Text('Deseja se registrar com o e-mail:'),
            Text(emailController.text,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar a lógica para registrar o usuário
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
