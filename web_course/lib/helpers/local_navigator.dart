import 'package:flutter/material.dart';
import 'package:web_course/constants/controllers.dart';
import 'package:web_course/widgets/side_menu/menu_item_list.dart';

import '../routing/router.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: OverViewPageRoute,
      onGenerateRoute: generateRoute,
    );
