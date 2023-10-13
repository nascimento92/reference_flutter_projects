import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx_firebase_exemplo1/screens/login/hello.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: Hello(),
      theme: CupertinoThemeData(
          brightness: Brightness.light, primaryColor: Color(0xFF08C187)),
    );
  }
}
