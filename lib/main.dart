import 'package:flutter/material.dart';
import 'package:mvvm/module/TestModule/page/login_page.dart';
import 'module/TestModule/page/dashboard_page.dart';
import 'module/module.dart';
import 'package:mvvm/core/core.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
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
    );
  }
}
