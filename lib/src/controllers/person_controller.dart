import 'package:flutter/material.dart';
import 'package:utilidades/src/models/person_model.dart';
import 'package:utilidades/src/services/sqlite_service.dart';
import 'package:path/path.dart';

class PersonController extends ChangeNotifier{
  final SqliteService _db = SqliteService();

  final List<PersonModel> _persons = [];

  List<PersonModel> get persons => List.unmodifiable(_persons);

  Future<void> loadPersons() async {
    _persons.clear();
    _persons.addAll(await _db.getAllPersons());
    notifyListeners();
  }

  Future<void> addPerson(String nome, int idade) async {
    final person = PersonModel(nome: nome, idade: idade);
    await _db.insertPerson(person);
    await loadPersons();
  }

  Future<void> deletePerson(int id) async {
    await _db.deletePerson(id);
    await loadPersons();
  }

}