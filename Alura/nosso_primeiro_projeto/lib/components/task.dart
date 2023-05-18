import 'package:flutter/material.dart';

import 'difficult.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(
      {super.key,
      required this.nome,
      required this.foto,
      required this.dificuldade});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  List<Color> currentColor = [
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.red,
    Colors.black
  ];
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: currentColor[colorIndex],
          ),
          height: 140,
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black26,
                    ),
                    width: 72,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        widget.foto,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.nome,
                          style: const TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Difficult(
                        dificuldade: widget.dificuldade,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 52,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if ((nivel / widget.dificuldade) == 10) {
                            colorIndex++;
                            nivel = 0;
                          } else if (nivel / widget.dificuldade != 10) {
                            nivel++;
                          } else {
                            nivel++;
                          }
                        });
                      },
                      child: Column(children: const [
                        Icon(Icons.arrow_drop_up),
                        Text('UP', style: TextStyle(fontSize: 12))
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: widget.dificuldade > 0
                          ? (nivel / widget.dificuldade) / 10
                          : 1,
                    ),
                  ),
                  Text(
                    'Nivel: $nivel',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}