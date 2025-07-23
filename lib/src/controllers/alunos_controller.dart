import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:utilidades/src/models/alunos_model.dart';

class AlunosController {

  final CollectionReference _collection = FirebaseFirestore.instance.collection('alunos');

  Future<void> adicionarAluno(AlunosModel aluno) {
    return _collection.add(aluno.toMap());
  }

  Future<void> atualizarAluno(String id, AlunosModel aluno) {
    return _collection.doc(id).update(aluno.toMap());
  }

  Future<void> removerAluno(String id) {
    return _collection.doc(id).delete();
  }
}