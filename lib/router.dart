import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/home/screens/home_screen.dart';
import 'package:pets_mall/common/widgets/bottom_bar.dart';
import 'Screen/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());

    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Error!! Page does not exist"),
                ),
              ));
  }
}
