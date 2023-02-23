import 'package:flutter/material.dart';
import 'package:web_course/widgets/side_menu/side_menu.dart';

import '../../helpers/local_navigator.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
        child: SideMenu(),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: localNavigator(),
        ),
      ),
    ]);
  }
}
