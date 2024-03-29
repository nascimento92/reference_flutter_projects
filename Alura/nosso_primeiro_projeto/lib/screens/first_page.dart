import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';
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
      body: Column(
        children: [
          // Expanded(
          //     flex: 1,
          //     child: SizedBox(
          //       width: 300,
          //       height: 50,
          //       child: Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               IconButton(
          //                   onPressed: () {
          //                     setState(() {});
          //                   },
          //                   icon: const Icon(Icons.refresh)),
          //               Text(
          //                   'Level Geral: ${TaksInherited.of(context).valorTotal}')
          //             ],
          //           ),
          //           LinearProgressIndicator(
          //             color: Colors.blue,
          //             value: TaksInherited.of(context).valorTotal > 0
          //                 ? TaksInherited.of(context).valorTotal / 100
          //                 : 1,
          //           )
          //         ],
          //       ),
          //     )),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100, top: 8),
              child: FutureBuilder<List<Task>>(
                future: TaskDao().findAll(),
                builder: ((context, snapshot) {
                  List<Task>? items = snapshot.data;

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    case ConnectionState.active:
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasData && items != null) {
                        if (items.isNotEmpty) {
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: ((context, index) {
                              final Task tarefa = items[index];
                              return tarefa;
                            }),
                          );
                        } else {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 80,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Sem Registros',
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: Text('Erro ao carregar Tarefas'),
                        );
                      }
                  }
                }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      )));
        },
        backgroundColor: Colors.red[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
