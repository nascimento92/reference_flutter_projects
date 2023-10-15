import 'package:flutter/material.dart';
import 'package:mobx_firebase_exemplo1/components/blue_image_page_scaffold.dart';
import 'package:mobx_firebase_exemplo1/components/lets_start.dart';
import 'package:mobx_firebase_exemplo1/components/logo.dart';
import 'package:mobx_firebase_exemplo1/components/termsAndConditions.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return BlueImagePageScaffold(body: [
      const Logo(heigth: 100, width: 100, radius: Radius.circular(40)),
      Text('Hello',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 40)),
      Column(
        children: [
          Text('WhatsApp is a Cross-plataform',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7), fontSize: 18)),
          Text('mobile messaging with friends',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7), fontSize: 18)),
          Text('all over the world',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7), fontSize: 18)),
        ],
      ),
      TermsAndConditions(onpressed: () {}),
      LetsStart(onPressed: () {})
    ], imagePath: 'images/bg.jpg');
  }
}
