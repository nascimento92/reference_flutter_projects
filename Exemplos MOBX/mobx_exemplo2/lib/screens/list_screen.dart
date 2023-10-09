import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exemplo2/screens/login_screen.dart';
import 'package:mobx_exemplo2/stores/list_store.dart';
import 'package:mobx_exemplo2/widgets/custom_text_field.dart';

ListStore listStore = ListStore();

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController tarefaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Barra superior
                    const Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      //nome Tarefa
                      Observer(
                        builder: (_) => CustomTextField(
                          controller: tarefaController,
                          hint: 'Tarefa',
                          obscure: false,
                          textInputType: TextInputType.text,
                          onChanged: listStore.setNewTodoTigle,
                          enable: true,
                          suffix: listStore.isFormValid
                              ? IconButton(
                                  onPressed: () {
                                    listStore.addTodo();
                                    tarefaController.text = "";
                                  },
                                  icon: const Icon(Icons.add))
                              : null,
                        ),
                      ),

                      //espaço
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Observer(
                          builder: (_) => ListView.separated(
                              itemBuilder: (_, index) {
                                return ListTile(
                                  title: Text(listStore.todoList[index]),
                                  onTap: () {},
                                );
                              },
                              separatorBuilder: (_, __) {
                                return const Divider();
                              },
                              itemCount: listStore.todoList.length),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
