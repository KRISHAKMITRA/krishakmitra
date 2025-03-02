import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:krishak/consts/enums.dart';
import 'package:krishak/funs/bindings/initial_binding.dart';
import 'package:krishak/views/home/controller/home_controller.dart';
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
      routes: [
        GoRoute(
          path: AppRoutes.home.path,
          builder: (context, state) {
            InitialBinding().dependencies();
            return const HomePage();
          },
        ),
      ],
    );
  }
}
