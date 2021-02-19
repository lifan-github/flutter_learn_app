import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes/application.dart';
import 'routes/routes.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Application.router.generator,
    );
  }
}