import 'package:flutter/material.dart';

import '../components/task.dart';

class TaksInherited extends InheritedWidget {
   TaksInherited({super.key, required super.child});

   List<Task> taskList = const [
    Task(
      nome: 'Aprender Flutter',
      foto: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
      dificuldade: 1,
    ),
    Task(
      nome: 'Andar de Bike',
      foto:
          'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg',
      dificuldade: 3,
    ),
    Task(
      nome: 'Meditar',
      foto:
          'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
      dificuldade: 5,
    ),
    Task(
      nome: 'Ler',
      foto:
          'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
      dificuldade: 5,
    )
  ];

  static TaksInherited of(BuildContext context){
    final TaksInherited? result = context.dependOnInheritedWidgetOfExactType<TaksInherited>();
    assert(result != null, 'no taskInherited found in context');
    return result!;
  }

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(nome: name, foto: photo, dificuldade: difficulty));
  }

  @override
  bool updateShouldNotify(TaksInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
    //throw UnimplementedError();
  }
}
