import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:krishak/firebase_options.dart';
import 'package:krishak/funs/bindings/initial_binding.dart';
import 'package:krishak/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();

  await Hive.openBox(Env.user);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRoute appRoute;
  @override
  void initState() {
    appRoute = AppRoute(context: context);
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Krishak',
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      localizationsDelegates: const [FlutterQuillLocalizations.delegate],
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routeInformationParser: appRoute.routers.routeInformationParser,
      routerDelegate: appRoute.routers.routerDelegate,
      routeInformationProvider: appRoute.routers.routeInformationProvider,
      // routerConfig: AppRoute(context: context).routers,
    );
  }
}

abstract class Env {
  static const String user = "userBox";
}
