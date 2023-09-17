//A page
import 'package:fluro/fluro.dart';
import 'package:mvvm/core/injection/injection.dart';
import 'package:mvvm/module/TestModule/page/cart_page.dart';
import 'package:mvvm/module/TestModule/page/detail_page.dart';
import 'package:mvvm/module/TestModule/page/login_page.dart';
import 'package:mvvm/module/TestModule/page/recover_page.dart';
import 'package:mvvm/module/TestModule/page/register_page.dart';

import '../../module/TestModule/model/home_response.dart';
import '../../module/TestModule/page/dashboard_page.dart';

class RoutesHandler {
  static final shared = RoutesHandler();
  final signInHandler = Handler(handlerFunc: (
    context,
    parameters,
  ) {
    return getIt.get<LoginPage>();
  });
  final cartHandler = Handler(handlerFunc: (
    context,
    parameters,
  ) {
    return getIt.get<CartPage>();
  });
  final homeHandler = Handler(handlerFunc: (
    context,
    parameters,
  ) {
    return getIt.get<DasboardPage>();
  });
  final signupHandler = Handler(handlerFunc: (
    context,
    parameters,
  ) {
    return getIt.get<RegisterPage>();
  });
  final forgotHandler = Handler(handlerFunc: (
    context,
    parameters,
  ) {
    return getIt.get<RecoverPage>();
  });
  final foodDetailHandler = Handler(handlerFunc: (
    context,
    parameters,
  ) {
    final data = context?.settings?.arguments as PopularFoodList;
    final DetailPage page = getIt.get();
    page.data = data;
    return page;
  });
}
