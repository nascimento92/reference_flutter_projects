import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/model/game_play.dart';
import 'package:jogo_memoria/pages/game_page.dart';
import 'package:provider/provider.dart';

class CardNivel extends StatelessWidget {
  final GamePlay gamePlay;
  const CardNivel({super.key, required this.gamePlay});

  startGame(BuildContext context) {
    context.read<GameController>().startGame(gamePlay: gamePlay);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GamePage(gamePlay: gamePlay),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => startGame(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
                color: gamePlay.modo == Modo.normal
                    ? Colors.white
                    : Round6Theme.color),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: gamePlay.modo == Modo.normal
                ? Colors.transparent
                : Round6Theme.color.withOpacity(.6)),
        child: Center(
          child: Text(
            gamePlay.nivel.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
