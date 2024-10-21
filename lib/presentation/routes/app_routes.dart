import 'package:flutter/material.dart';

import '__routes__.dart';

final Map<String, WidgetBuilder> _routeMap = {
  ...HomeRouteMap,
  ...TransferRouteMap,
  ...signInRouteMap,
  ...signUpRouteMap,
};

class AppRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final builder = _routeMap[settings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }

    return null;
  }

  static String getInitialRoute() {
    return '/home';
  }
}
