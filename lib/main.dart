import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/core/service/progress_hub.dart';
import 'package:mvvm/module/TestModule/page/login_page.dart';
import 'core/router/routes.dart';
import 'module/TestModule/page/dashboard_page.dart';
import 'module/module.dart';
import 'package:mvvm/core/core.dart';
class App {
  static final shared = App();
  void run() {
    _initApp();
    runApp(const MyApp());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initApp() {
    configureDependencies();
    Routes.configureRoutes();
    Loader.shared.init();
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Intl.getCurrentLocale()),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      home: LoginPage(),
      builder: Loader.shared.init(),
    );
  }
}
