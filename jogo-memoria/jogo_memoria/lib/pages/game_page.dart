import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/game_settings.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/model/game_opcao.dart';
import 'package:jogo_memoria/model/game_play.dart';
import 'package:jogo_memoria/widgets/card_game.dart';
import 'package:jogo_memoria/widgets/feedback_game.dart';
import 'package:jogo_memoria/widgets/game_score.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final GamePlay gamePlay;
  const GamePage({super.key, required this.gamePlay});

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: GameScore(modo: gamePlay.modo)),
      body: Observer(builder: (_) {
        if (gameController.venceu) {
          return const FeedbackGame(resultado: Resultado.aprovado);
        } else if (gameController.perdeu) {
          return const FeedbackGame(resultado: Resultado.eliminado);
        } else {
          return Center(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: GameSettings.gameBoardAxisCount(gamePlay.nivel),
              padding: const EdgeInsets.all(24),
              children: gameController.gameCards.map((GameOpcao go) => CardGame(modo: gamePlay.modo, gameOpcao: go)).toList(),
            ),
          );
        }
      }),
    );
  }
}
