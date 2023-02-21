import 'package:flutter/material.dart';
import 'package:web_course/pages/overview/overview.dart';
import 'package:web_course/routing/routes.dart';

import '../pages/authentication/authentication.dart';
import '../pages/clients/clients.dart';
import '../pages/drivers/drivers.dart';
import '../widgets/custom_animationRoute.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(const OverViewPage());
    case DriversPageRoute:
      return _getPageRoute(const DriversPage());
    case ClientsPageRoute:
      return _getPageRoute(const ClientsPage());
    case AuthenticationPageRoute:
      return _getPageRoute(const AuthenticationPage());
    default:
      return _getPageRoute(const OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  // return MaterialPageRoute(builder: ((context) => child));]
  return MyCustomRoute(builder: ((context) => child));
}
