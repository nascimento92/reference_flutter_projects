import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';
import 'package:nosso_primeiro_projeto/screens/minha_primeira_tela.dart';

import 'data/task_inherited.dart';
import 'screens/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstWidget(),
      //home: TaksInherited(child: const FirstPage(title: 'Tarefas'),),
    );
  }
}
