import 'package:flutter/material.dart';
import 'package:web_course/widgets/structure_pages/large_screen.dart';
import 'package:web_course/widgets/structure_pages/medium_screen.dart';
import 'package:web_course/widgets/side_menu/side_menu.dart';
import 'package:web_course/widgets/structure_pages/small_screen.dart';
import 'package:web_course/widgets/structure_pages/top_nav.dart';

import 'helpers/responsive.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: const Drawer(child: SideMenu()),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: MediumScreen(),
      ),
    );
  }
}
