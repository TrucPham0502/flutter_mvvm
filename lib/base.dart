import 'dart:developer';

import 'package:flutter/material.dart';
import 'base_viewmodel.dart';
import 'extension.dart';

abstract class Presenter {}

abstract class BaseStatefulWidgetPage<VM extends BaseViewModel>
    extends StatefulWidget implements Presenter {
  BaseStatefulWidgetPage({Key? key}) : super(key: key);
  late ErrorTracker errorTracker;
  late ActivityIndicator activityIndicator;
  VM get viewModel;
}

abstract class BaseStatePage<VM extends BaseViewModel,
        P extends BaseStatefulWidgetPage<VM>> extends State<P>
    with DisposableWidget
    implements Presenter {
  late VM viewModel;
  bool _isLoading = false;
  @override
  void initState() {
    viewModel = widget.viewModel;
    performBinding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widget = [appBody(context)];
    if (_isLoading) {
      widget.add(const CircularProgressIndicator());
    }
    return Scaffold(
        appBar: appBar(context),
        body: Center(
          child:
              Stack(alignment: AlignmentDirectional.center, children: widget),
        ));
  }

  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  Widget appBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [Text("Page not found")],
    );
  }

  void performBinding() {
    widget.errorTracker = viewModel.errorTracker;
    widget.activityIndicator = viewModel.activityIndicator;
    widget.errorTracker.asStream().listen((event) {
      handleError(event);
    }).canceledBy(this);
    widget.activityIndicator.asStream().listen((event) {
      setState(() {
        _isLoading = event;
      });
    }).canceledBy(this);
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
    super.dispose();
  }
}
