import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/host.png',
          width: 70,
          height: 100,
        ),
        const SizedBox(height: 20,),
        RichText(
          text: TextSpan(
            text: 'Round 6 ',
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 30),
            children: const [
              TextSpan(
                text: 'Memory',
                style: TextStyle(color: Round6Theme.color)
              ),
              
            ]
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
