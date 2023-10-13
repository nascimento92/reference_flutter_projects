import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/screens/calls.dart';
import 'package:mobx_firebase_exemplo1/screens/chats.dart';
import 'package:mobx_firebase_exemplo1/screens/people.dart';
import 'package:mobx_firebase_exemplo1/screens/settings.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  var screens = [
    const Chats(),
    const Calls(),
    const People(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              label: "People",
              icon: Icon(CupertinoIcons.person_alt_circle),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(CupertinoIcons.settings_solid),
            ),
          ]),
          tabBuilder: (context, index) {
            return screens[index];
          }),
    );
  }
}
