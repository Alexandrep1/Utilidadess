import 'package:flutter/material.dart';
import 'package:utilidades/src/views/firebase_register_view.dart';

class FirebaseLoginView extends StatefulWidget {
  const FirebaseLoginView({super.key});

  @override
  State<FirebaseLoginView> createState() => _FirebaseLoginViewState();
}

class _FirebaseLoginViewState extends State<FirebaseLoginView> {
  bool _loading = false;

  void _abrirCadastro() {
    // Aqui normalmente você iria para uma tela de cadastro diferente
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const FirebaseRegisterView(), // Substitua por CadastroView()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login com Firebase")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "E-mail"),
              validator: (value) {
                return value == null || value.isEmpty ? "Informe o e-mail" : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Senha"),
              obscureText: true,
              validator: (value) {
                return value == null || value.length < 6 ? "Senha inválida" : null;
              },
            ),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      // ação de login aqui
                    },
                    child: const Text("Entrar"),
                  ),
            TextButton(
              onPressed: _abrirCadastro,
              child: const Text("Não tem conta? Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}
