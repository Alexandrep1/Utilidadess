class AlunosModel {
  final String id;
  final String nome;
  final int idade;
  final String turma;

  AlunosModel({
    required this.id,
    required this.nome,
    required this.idade,
    required this.turma,
  });

  factory AlunosModel.fromMap(Map<String, dynamic> data, String id) {
    return AlunosModel(
      id: id,
      nome: data['nome'],
      idade: data['idade'],
      turma: data['turma'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'idade': idade, 'turma': turma};
  }
}
