import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/widgets/start_button.dart';
import 'package:provider/provider.dart';

class FeedbackGame extends StatelessWidget {
  final Resultado resultado;
  const FeedbackGame({super.key, required this.resultado});

  String getResultado() {
    return resultado == Resultado.aprovado ? 'aprovado' : 'eliminado';
  }

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Provider.of<GameController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            getResultado().toUpperCase(),
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Image.asset('images/${getResultado()}.png'),
          ),
          resultado == Resultado.eliminado
              ? StartButtton(
                  title: 'Tentar Novamente',
                  color: Colors.white,
                  action: ()=> gameController.restartGame(),
                )
              : StartButtton(
                  title: 'Próximo Nível',
                  color: Colors.white,
                  action: ()=> gameController.nextLevel(),
                )
        ],
      ),
    );
  }
}
