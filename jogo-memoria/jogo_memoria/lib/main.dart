import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/controller/game_controller.dart';
import 'package:jogo_memoria/pages/home.dart';
import 'package:jogo_memoria/repositories/recordes_repository.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        Provider<RecordesRepository>(create: (_) => RecordesRepository()),
        ProxyProvider<RecordesRepository, GameController>(update: (_, repo, __)=> GameController(recordesRepository: repo))
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
