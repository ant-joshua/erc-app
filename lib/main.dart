import 'package:erc_app/ui/screens/auth/login_screen.dart';
import 'package:erc_app/ui/screens/auth/register_screen.dart';
import 'package:erc_app/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:erc_app/core/constants/color.dart';

import 'package:erc_app/core/di/injector_provider.dart';

void main() {
  setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERC Apps',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: elPrimaryMaterialColor,
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => MainScreen(),
        "/login": (ctx) => const LoginScreen(),
        "/register": (ctx) => const RegisterScreen()
      },
    );
  }
}
