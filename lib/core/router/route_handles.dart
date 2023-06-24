
 //A page
import 'package:fluro/fluro.dart';
import 'package:mvvm/module/TestModule/page/detail_page.dart';
import 'package:mvvm/module/TestModule/page/recover_page.dart';
import 'package:mvvm/module/TestModule/page/register_page.dart';

import '../../module/TestModule/model/home_response.dart';
import '../../module/TestModule/page/dashboard_page.dart';

final homeHandler = Handler(handlerFunc: (context, parameters,) {
    return DasboardPage();
});
final signupHandler = Handler(handlerFunc: (context, parameters,) {
    return const RegisterPage();
});
final forgotHandler = Handler(handlerFunc: (context, parameters,) {
    return const RecoverPage();
});
final foodDetailHandler = Handler(handlerFunc: (context, parameters,) {
    final data = context?.settings?.arguments as PopularFoodList;
    return DetailPage(data);
});
