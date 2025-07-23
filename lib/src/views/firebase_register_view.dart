import 'package:flutter/material.dart';

class FirebaseRegisterView extends StatefulWidget {
  const FirebaseRegisterView({super.key});

  @override
  State<FirebaseRegisterView> createState() => _FirebaseRegisterViewState();
}

class _FirebaseRegisterViewState extends State<FirebaseRegisterView> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("cadastro firebase"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "nome"),
                validator: (value) =>
                value == null || value.isEmpty ? "informe seu nome" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "e-mail"),
                validator: (value) =>
                value == null || value.isEmpty ? "informe seu e-mail" : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "senha"),
                validator: (value) =>
                value == null || value.length < 6 ? "senha inválida" : null,
              ),
              const SizedBox(height: 20,),
              _loading ? const CircularProgressIndicator() :
              ElevatedButton(onPressed: () => {}, child: Text("cadastrar"))
            ],
          ),
        ),
      ),
    );
  }
}