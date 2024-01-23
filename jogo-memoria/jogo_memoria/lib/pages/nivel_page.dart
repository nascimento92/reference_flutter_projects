import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
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
          children: [
            CardNivel(modo: widget.modo, nivel: 6,),
            CardNivel(modo: widget.modo, nivel: 8,),
            CardNivel(modo: widget.modo, nivel: 10,),
            CardNivel(modo: widget.modo, nivel: 12,),
            CardNivel(modo: widget.modo, nivel: 16,),
            CardNivel(modo: widget.modo, nivel: 18,),
            CardNivel(modo: widget.modo, nivel: 20,),
            CardNivel(modo: widget.modo, nivel: 24,),
            CardNivel(modo: widget.modo, nivel: 28,),
          ],
        ),
      ),
    );
  }
}
