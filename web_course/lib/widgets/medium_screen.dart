import 'package:flutter/material.dart';
import 'package:web_course/widgets/side_menu.dart';

import '../helpers/local_navigator.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
        child: SideMenu(),
      ),
      Expanded(
        flex: 5,
        child: localNavigator(),
      ),
    ]);
  }
}
