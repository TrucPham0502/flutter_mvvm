import 'dart:ffi';

import 'package:mvvm/core/base/base_stateful_widget_page.dart';
import 'package:mvvm/core/base/base_viewmodel.dart';
import 'package:mvvm/core/rx/activity_indicator.dart';
import 'package:mvvm/core/rx/error_tracker.dart';
import 'package:mvvm/core/service/progress_hub.dart';
import 'package:rxdart/rxdart.dart';

import '../error/error.dart';
import '../rx/disposable_widget.dart';

import 'package:flutter/material.dart';

abstract class Presenter {}

abstract class BaseStatePage<VM extends BaseViewModel<I, O>, I, O,
        P extends BaseStatefulWidgetPage> extends State<P>
    with DisposableWidget
    implements Presenter {
  late ErrorTracker errorTracker;
  late ActivityIndicator activityIndicator;
  late VM viewModel;
  late O output;
  final viewDidApearing = PublishSubject();
  late BuildContext loaderContext;
  @override
  void initState() {
    viewModel = makeViewModel();
    performBinding();
    super.initState();
    viewDidApearing.add(1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(context),
        body: appBody(context),
      ),
    );
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget appBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Text(
          "Page under construction",
          style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ))
      ],
    );
  }

  VM makeViewModel();
  I makeInput();
  void performBinding() {
    errorTracker = viewModel.errorTracker;
    activityIndicator = viewModel.activityIndicator;
    errorTracker.asStream().listen((event) {
      handleError(event);
    }).canceledBy(this);
    activityIndicator.asStream().listen((event) {
      if (event) {
        Loader.show(context,
            progressIndicator: const CircularProgressIndicator(),
            overlayColor: Colors.black.withOpacity(0.3));
      } else {
        Loader.hide();
      }
    }).canceledBy(this);
    output = viewModel.transform(makeInput());
  }

  void handleError(Object error) {
    if (error is AppError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("error: ${error.message} code: ${error.code}"),
      ));
    }
  }

  @override
  void dispose() {
    cancelSubscriptions();
    Loader.hide();
    super.dispose();
  }
}
