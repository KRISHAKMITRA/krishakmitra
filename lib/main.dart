import 'package:flutter/material.dart';
import 'package:krishak/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Krishak',
      themeMode: ThemeMode.system,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: AppRoute(context: context).routers,
    );
  }
}
