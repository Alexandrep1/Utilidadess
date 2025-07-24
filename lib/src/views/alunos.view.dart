import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/alunos_controller.dart';
import 'package:utilidades/src/models/alunos_model.dart';

class AlunosView extends StatefulWidget {
  const AlunosView({super.key});

  @override
  State<AlunosView> createState() => _AlunosViewState();
}

class _AlunosViewState extends State<AlunosView> {
  final AlunosController _controller = AlunosController();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _idade = TextEditingController();
  final TextEditingController _turma = TextEditingController();

  void _abrirDialog(AlunosModel? aluno) {
    String tituloDialog = 'Cadastrar aluno';
    String action = 'add';
    String? alunoId;
    if (aluno != null) {
      _nome.text = aluno.nome;
      _idade.text = aluno.idade.toString();
      _turma.text = aluno.turma;
      tituloDialog = "Editar aluno";
      action = "edit";
      alunoId = aluno.id;
    } else {
      _nome.clear();
      _idade.clear();
      _turma.clear();
      alunoId = null;
    }
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(tituloDialog),
            content: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nome,
                      decoration: const InputDecoration(labelText: "Nome"),
                    ),
                    TextField(
                      controller: _idade,
                      decoration: const InputDecoration(labelText: "Idade"),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: _turma,
                      decoration: const InputDecoration(labelText: "Turma"),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.close),
              ),
              ElevatedButton(
                onPressed: () {
                  final sucesso = _salvarAluno(action, alunoId);
                  if (sucesso) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Erro ao salvar")),
                    );
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.save),
                    SizedBox(width: 5),
                    Text("Salvar"),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  bool _salvarAluno(String action, String? alunoId) {
    final nome = _nome.text.trim();
    final idade = int.tryParse(_idade.text.trim()) ?? 0;
    final turma = _turma.text.trim();

    if (nome.isEmpty || turma.isEmpty || idade <= 0) {
      return false;
    }

    if (action == 'add') {
      _controller.adicionarAluno(
        AlunosModel(id: '', nome: nome, idade: idade, turma: turma),
      );
    } else if (action == 'edit' && alunoId != null) {
      _controller.atualizarAluno(
        alunoId,
        AlunosModel(id: alunoId, nome: nome, idade: idade, turma: turma),
      );
    }

    // Limpar campos
    _nome.clear();
    _idade.clear();
    _turma.clear();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<List<AlunosModel>>(
          stream: _controller.getAlunos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Nenhum dado encontrado"));
            }

            final alunos = snapshot.data!;

            return ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                final aluno = alunos[index];

                return ListTile(
                  title: Text(aluno.nome),
                  subtitle: Text(
                    "Idade: ${aluno.idade}, Turma: ${aluno.turma}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _abrirDialog(aluno),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _controller.removerAluno(aluno.id),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirDialog(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
