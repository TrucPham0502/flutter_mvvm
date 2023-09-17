import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/core/service/progress_hub.dart';
import 'package:mvvm/module/TestModule/page/login_page.dart';
import 'core/core.dart';
import 'core/injection/injection.dart';
import 'core/router/routes.dart';
import 'package:flutter/foundation.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  static void setLocale(BuildContext context, Language newLocale) async {
    _MyApp? state = context.findAncestorStateOfType<_MyApp>();
    state?.changeLanguage(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyApp();
}
enum Language { 
  en, vi
}
extension LanguageEx on String {
  Language toEnum() => Language.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}
class _MyApp extends State<MyApp> {
  Locale _locale = Locale(Intl.getCurrentLocale());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      home: getIt.get<LoginPage>(),
      builder: Loader.shared.init(),
    );
  }

  changeLanguage(Language locale) {
    setState(() {
      _locale = Locale(locale.name);
    });
  }
}
