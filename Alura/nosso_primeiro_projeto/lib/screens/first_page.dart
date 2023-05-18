import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  FirstPage({super.key, required this.title});

  final String title;
  bool opacidade = true;

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
      body: AnimatedOpacity(
        opacity: widget.opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 600),
        child: ListView(
          children: const [
            Task(
              nome: 'Aprender Flutter',
              foto:
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
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
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.opacidade = !widget.opacidade;
          });
        },
        backgroundColor: Colors.red[400],
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
