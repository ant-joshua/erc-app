import 'package:erc_app/ui/router/route_list.dart';
import 'package:erc_app/ui/screens/auth/login_screen.dart';
import 'package:erc_app/ui/screens/auth/register_screen.dart';
import 'package:erc_app/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  /// Initializing route
  static Route<dynamic>? generate(RouteSettings settings) {
    /// Declaring argumen route
    // final args = settings.arguments;
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: const RouteSettings(name: routeLogin),
        );
      case routeRegister:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings: const RouteSettings(name: routeRegister),
        );
      case routeHome:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
          settings: const RouteSettings(name: routeHome),
        );
    }

    return null;
  }
}
