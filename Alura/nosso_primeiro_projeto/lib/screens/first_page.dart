import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

import '../data/task_inherited.dart';

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.title});

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: TaksInherited.of(context).taskList,
        padding: EdgeInsets.only(bottom: 100, top: 8),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context,)));
        },
        backgroundColor: Colors.red[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
