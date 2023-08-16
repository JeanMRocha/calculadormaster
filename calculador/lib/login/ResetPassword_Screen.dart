// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Redefinir Senha')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Você solicitou a redefinição de senha para:'),
            Text(email, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementar a lógica para enviar um e-mail de redefinição de senha
              },
              child: const Text('Enviar E-mail de Redefinição'),
            ),
          ],
        ),
      ),
    );
  }
}
