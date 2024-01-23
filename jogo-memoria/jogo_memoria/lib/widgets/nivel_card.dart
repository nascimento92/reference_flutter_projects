import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/pages/game_page.dart';

class CardNivel extends StatelessWidget {
  final Modo modo;
  final int nivel;
  const CardNivel({super.key, required this.modo, required this.nivel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GamePage(modo: modo, nivel: nivel,))),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 90,
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: modo==Modo.normal ? Colors.white : Round6Theme.color),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: modo == Modo.normal ? Colors.transparent : Round6Theme.color.withOpacity(.6)
        ),
        child: Center(
          child: Text(nivel.toString(), style: const TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
