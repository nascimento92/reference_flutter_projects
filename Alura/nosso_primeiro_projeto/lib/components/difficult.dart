import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/star.dart';

class Difficult extends StatelessWidget {
  final int dificuldade;
  const Difficult({super.key, required this.dificuldade});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Star(
          tamanho: 15,
          cor: dificuldade >= 1 ? Colors.blue : Colors.blue[100],
        ),
        Star(
          tamanho: 15,
          cor: dificuldade >= 2 ? Colors.blue : Colors.blue[100],
        ),
        Star(
          tamanho: 15,
          cor: dificuldade >= 3 ? Colors.blue : Colors.blue[100],
        ),
        Star(
          tamanho: 15,
          cor: dificuldade >= 4 ? Colors.blue : Colors.blue[100],
        ),
        Star(
          tamanho: 15,
          cor: dificuldade >= 5 ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
