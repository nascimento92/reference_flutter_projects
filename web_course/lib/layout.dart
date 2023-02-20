import 'package:flutter/material.dart';
import 'package:web_course/widgets/large_screen.dart';
import 'package:web_course/widgets/medium_screen.dart';
import 'package:web_course/widgets/small_screen.dart';
import 'package:web_course/widgets/top_nav.dart';

import 'helpers/responsive.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
        mediumScreen: MediumScreen(),
      ),
    );
  }
}
