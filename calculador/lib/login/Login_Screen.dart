import 'package:calculador/login/ResetPassword_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> checkIfEmailIsRegistered(String email) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.fetchSignInMethodsForEmail(email);
    // Se nenhum erro for lançado, o e-mail está registrado
    return true;
  } catch (e) {
    // Se um erro for lançado, o e-mail não está registrado
    return false;
  }
}

Future<void> _showMyDialog(BuildContext context, String email) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Impedir o fechamento tocando fora do diálogo
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('E-mail não cadastrado'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('O e-mail $email não está cadastrado.'),
              const Text(
                  'Deseja se registrar com este e-mail ou tentar outro?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Registrar'),
            onPressed: () {
              // Implemente a lógica para registro
              Navigator.of(context).pop(); // Fechar o diálogo
            },
          ),
          TextButton(
            child: const Text('Tentar Outro'),
            onPressed: () {
              Navigator.of(context).pop(); // Fechar o diálogo
            },
          ),
        ],
      );
    },
  );
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  LoginScreen({super.key});

  void _checkEmail(BuildContext context) async {
    final email = emailController.text;
    bool isEmailRegistered = await checkIfEmailIsRegistered(email);

    if (isEmailRegistered) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResetPasswordScreen(email: email)),
      );
    } else {
      _showMyDialog(context, email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkEmail(context),
              child: const Text('Verificar E-mail'),
            ),
          ],
        ),
      ),
    );
  }
}
