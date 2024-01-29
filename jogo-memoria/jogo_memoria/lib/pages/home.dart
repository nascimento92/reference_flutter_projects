import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/pages/nivel_page.dart';
import 'package:jogo_memoria/widgets/logo.dart';
import 'package:jogo_memoria/widgets/recordes.dart';
import 'package:jogo_memoria/widgets/start_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              StartButtton (
                action: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NivelPage(modo: Modo.normal)));
                },
                color: Colors.white,
                title: 'Modo Normal',
              ),
              StartButtton(
                action: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NivelPage(modo: Modo.round6)));
                },
                color: Round6Theme.color,
                title: 'Modo Round 6',
              ),
              const SizedBox(height: 20,),
              const Record()
            ],
          ),
        ),
      ),
    );
  }
}
