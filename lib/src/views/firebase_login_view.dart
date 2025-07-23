import 'package:flutter/material.dart';

class FirebaseLoginView extends StatefulWidget {
  const FirebaseLoginView({super.key});

  @override
  State<FirebaseLoginView> createState() => _FirebaseLoginViewState();
}

class _FirebaseLoginViewState extends State<FirebaseLoginView> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login com Firebase")),
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
            SizedBox(height: 20,),
            //botao ou loading
            _loading ? const CircularProgressIndicator() :
            ElevatedButton(onPressed: () => {}, child: Text("entrar")),
            TextButton(onPressed: () => {}, child: const Text("não tem conta? cadastre-se"))
          ],
        ),
      ),
    );
  }
}
