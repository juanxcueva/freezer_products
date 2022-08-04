


import 'package:flutter/material.dart';
import 'package:freezer_products/app/ui/routes/app_routes.dart';
import 'package:freezer_products/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freezer_App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: routes,
      navigatorObservers: [
        router.observer,
      ],
    );
  }
}