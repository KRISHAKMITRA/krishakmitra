import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:krishak/consts/enums.dart';
import 'package:krishak/views/home/views/home.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoute {
  final BuildContext context;

  AppRoute({required this.context});

  bool isLogged = false;

  GoRouter get routers {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoutes.home.path,
      debugLogDiagnostics: true,
      routes: [GoRoute(path: AppRoutes.home.path, builder: (context, state) => const HomePage())],
    );
  }
}
