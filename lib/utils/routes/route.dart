import 'package:flutter/material.dart';
import 'package:grocery_app/screens/dashboards/dashboard_screen.dart';
import 'package:grocery_app/screens/home/home_screen.dart';
import 'package:grocery_app/screens/login/login_screen.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/utils/routes/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomeRoute:
      return _getPageRoute(
          routeName: settings.name!, viewToShow: WelcomeScreen());
    case loginRoute:
      return _getPageRoute(
          routeName: settings.name!, viewToShow: LoginScreen());
    case dashboardRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const DashboardScreen(),
      );
    case homeRoute:
      return _getPageRoute(routeName: settings.name!, viewToShow: HomeScreen());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
