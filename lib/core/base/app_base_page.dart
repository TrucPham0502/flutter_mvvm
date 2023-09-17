import '../error/error.dart';
import '../rx/disposable_widget.dart';

import 'package:flutter/material.dart';

import 'base_stateful_widget_page.dart';

abstract class AppBasePage extends State<BaseStatefulWidgetPage>{
  void handleError(Error error) {
    switch (error.runtimeType) {
      case ApiError:
        {
          final _err = error as ApiError;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("error: ${_err.message} code: ${_err.code}"),
          ));
          break;
        }
      default:
        print("handle error: ${error.stackTrace}");
    }
  }

 
}
