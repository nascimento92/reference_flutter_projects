import 'package:flutter/material.dart';
import 'package:mobx_exemplo2/screens/login_screen.dart';
import 'package:mobx_exemplo2/stores/login_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Mobx Totorial',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            primaryColor: Colors.deepPurpleAccent,
            scaffoldBackgroundColor: Colors.deepPurpleAccent),
        home: const LoginScreen(),
      ),
    );
  }
}

//aula 9/11
//https://www.youtube.com/watch?v=J_uR90gWT80&list=PLR5GUTqrcwXim6ZCDvRpsak8CB8_mreCE&index=9&ab_channel=Startto