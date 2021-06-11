import 'package:erc_app/core/utils/navigation/navigation.utils.dart';
import 'package:erc_app/provider_starter.dart';
import 'package:erc_app/ui/router/route_generator.dart';
import 'package:erc_app/ui/router/route_list.dart';
import 'package:flutter/material.dart';
import 'package:erc_app/core/constants/color.dart';

import 'package:erc_app/core/di/injector_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  // Implement Dependency Injection
  setupInjector();
  // Call Provider Starter
  List<SingleChildWidget> providers = await ProviderStarter.register();
  // Running main app
  runApp(MyApp(
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  final List<SingleChildWidget>? providers;
  const MyApp({Key? key, required this.providers}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers!,
      child: MaterialApp(
        navigatorKey: inject<NavigationUtils>().navigatorKey,
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
        initialRoute: routeHome,
        onGenerateRoute: RouterGenerator.generate,
      ),
    );
  }
}
