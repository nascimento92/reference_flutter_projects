import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/game_settings.dart';
import 'package:jogo_memoria/model/game_play.dart';
import 'package:jogo_memoria/widgets/card_game.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;
  const GamePage({super.key, required this.gamePlay});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(gamePlay.modo == Modo.round6
                  ? Icons.my_location
                  : Icons.touch_app_rounded),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '18',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
          Image.asset(
            'images/host.png',
            width: 38,
            height: 60,
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ]),
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.nivel),
          padding: const EdgeInsets.all(24),
          children: List.generate(
              gamePlay.nivel,
              (index) =>
                  CardGame(modo: gamePlay.modo, opcao: Random().nextInt(14))),
        ),
      ),
    );
  }
}
