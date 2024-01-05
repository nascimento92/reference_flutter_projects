// ignore_for_file: avoid_print

import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String deletaBle = 'DROP TABLE $_tablename';
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_id TEXT, '
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'TASKTABLE';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _id = 'id';

  save(Task tarefa) async {
    print('Iniciando o save');
    final Database db = await getDatabase();
    var itemExists = await find(tarefa.id.toString());
    if (itemExists.isEmpty) {
      print('A tarefa não existia');
      return await db.insert(_tablename, toMap(tarefa));
    } else {
      print('A tarefa já existia');
      return await db.update(_tablename, toMap(tarefa),
          where: '$_id=?', whereArgs: [tarefa.id]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em map');
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_id] = tarefa.id;
    print('Mapa de tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    dropTable();
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> listaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in listaDeTarefas) {
      tarefas.add(Task(
          id: linha[_id],
          nome: linha[_name],
          foto: linha[_image],
          dificuldade: linha[_difficulty]));
    }

    return tarefas;
  }

  Future<List<Task>> find(String id) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    print('Procurando tarefa com o id: $id');
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_id = ?', whereArgs: [id]);
    print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String id) async {
    print('deletando a tarefa');
    final Database bancoDeDados = await getDatabase();
    bancoDeDados.delete(_tablename, where: '$_id = ?', whereArgs: [id]);
    print('Tarefa excluída.');
  }

  dropTable() async {
    final Database bancoDeDados = await getDatabase();
    bancoDeDados.delete(_tablename);
  }
}
