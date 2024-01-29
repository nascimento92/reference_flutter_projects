import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<GameController>(create: (_) => GameController())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Round 6 memory',
      debugShowCheckedModeBanner: false,
      theme: Round6Theme.theme,
      home: const Home(),
    );
  }
}
