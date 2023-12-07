import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class taskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'TASKTABLE';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task task){
    
  }

  Future<List<Task>> findAll() async{
    print('acessando o findall');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
    print('procurando dados');
    print('encontrando... ${result}');
    return toList(result);

  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas){
    print('acessando to list');
    final List<Task> tarefas = [];
    for(Map<String,dynamic> linha in mapaDeTarefas){
      final Task tarefa = Task(nome: linha[_name], foto: linha[_image], dificuldade: linha[_difficulty]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

}
