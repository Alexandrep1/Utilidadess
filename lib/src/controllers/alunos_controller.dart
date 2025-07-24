import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utilidades/src/models/alunos_model.dart';

class AlunosController {
  final CollectionReference _collection = FirebaseFirestore.instance.collection(
    'alunos',
  );

  Future<void> adicionarAluno(AlunosModel aluno) {
    return _collection.add(aluno.toMap());
  }

  Future<void> atualizarAluno(String id, AlunosModel aluno) {
    return _collection.doc(id).update(aluno.toMap());
  }

  Future<void> removerAluno(String id) {
    return _collection.doc(id).delete();
  }

  Stream<List<AlunosModel>> getAlunos() {
    return _collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AlunosModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
