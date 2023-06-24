import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/core/router/route_handles.dart';

class RoutesPath {
     static String home = "/"; 
     static String signup = "/account/signup"; 
     static String forgotPassword = "/account/forgot"; 
     static String foodDetail = "/Food/detail"; 
}
class Routes {
  static final router = FluroRouter();

  static void configureRoutes() {
    router.define(RoutesPath.home, handler: homeHandler);
    router.define(RoutesPath.signup, handler: signupHandler);
    router.define(RoutesPath.forgotPassword, handler: forgotHandler);
    router.define(RoutesPath.foodDetail, handler: foodDetailHandler);
  }

  static push(BuildContext context, String path, { Object? data }) {
    router.navigateTo(context, path, routeSettings: RouteSettings(
      arguments: data
    ), transition: TransitionType.native);
  }
  static pop(BuildContext context){
    router.pop(context);
  }
  static present(BuildContext context, String path, { Object? data }) {
    router.navigateTo(context, path, routeSettings: RouteSettings(
      arguments: data
    ));
  }
  static setRoot(BuildContext context, String path, { Object? data }) {
    router.navigateTo(context, path, routeSettings: RouteSettings(
      arguments: data
    ), rootNavigator: true, clearStack: true);
  }
}
