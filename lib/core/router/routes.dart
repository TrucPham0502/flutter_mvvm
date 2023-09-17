import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/core/router/route_handles.dart';

class RoutesPath {
     static String home = "/"; 
     static String signup = "/account/signup"; 
     static String signin = "/account/signin"; 
     static String forgotPassword = "/account/forgot"; 
     static String foodDetail = "/Food/detail"; 
    static String cart = "/account/cart"; 
}
class Routes {
  static final router = FluroRouter();

  static void configureRoutes() {
    router.define(RoutesPath.home, handler: RoutesHandler.shared.homeHandler);
    router.define(RoutesPath.signup, handler: RoutesHandler.shared.signupHandler);
    router.define(RoutesPath.forgotPassword, handler: RoutesHandler.shared.forgotHandler);
    router.define(RoutesPath.foodDetail, handler: RoutesHandler.shared.foodDetailHandler);
    router.define(RoutesPath.signin, handler:RoutesHandler.shared.signInHandler);
    router.define(RoutesPath.cart, handler: RoutesHandler.shared.cartHandler);
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
