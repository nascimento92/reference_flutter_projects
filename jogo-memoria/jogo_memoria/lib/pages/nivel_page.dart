import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/game_settings.dart';
import 'package:jogo_memoria/model/game_play.dart';
import 'package:jogo_memoria/widgets/nivel_card.dart';

class NivelPage extends StatefulWidget {
  final Modo modo;
  const NivelPage({super.key, required this.modo});

  @override
  State<NivelPage> createState() => _NivelPageState();
}

class _NivelPageState extends State<NivelPage> {
  @override
  Widget build(BuildContext context) {
    final niveis = GameSettings.niveis
        .map((n) => CardNivel(gamePlay: GamePlay(modo: widget.modo, nivel: n)))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nivel do Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.all(24),
          children: niveis,
        ),
      ),
    );
  }
}
