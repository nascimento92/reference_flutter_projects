import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:uuid/uuid.dart';

class FormScreen extends StatefulWidget {
  final BuildContext taskContext;
  FormScreen({super.key, required this.taskContext});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController difficultyController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                border: Border.all(width: 3, color: Colors.black26),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o Nome da Tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nome',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira a dificuldade.';
                        }

                        if ((value != null && value.isNotEmpty)) {
                          if (int.parse(value) < 1 || int.parse(value) > 5) {
                            return 'Dificuldade incorreta deve ser de 1 a 5.';
                          }
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Dificuldade',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Imagem',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkac5A1SaosApRSGSi6Saq4kqlE_Mysi0KO5mhqrU&s',
                              fit: BoxFit.cover);
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var uuid = const Uuid();
                          String u = uuid.v1();

                          TaskDao().save(
                            Task(
                              id: u,
                              nome: nameController.text,
                              foto: imageController.text,
                              dificuldade: int.parse(difficultyController.text),
                            ),
                          );

                          // TaksInherited.of(widget.taskContext).newTask(
                          //     nameController.text,
                          //     imageController.text,
                          //     int.parse(difficultyController.text),
                          //     uuid.v1().toString());
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Salvando nova tarefa"),
                            elevation: 150,
                            behavior: SnackBarBehavior.floating,
                          ));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
