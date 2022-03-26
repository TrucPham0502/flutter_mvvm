import 'package:mvvm/core/base/base_stateful_widget_page.dart';
import 'package:mvvm/core/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../error/error.dart';
import '../rx/disposable_widget.dart';

import 'package:flutter/material.dart';

abstract class Presenter {}

abstract class BaseStatePage<VM extends BaseViewModel,
        P extends BaseStatefulWidgetPage<VM>> extends State<P>
    with DisposableWidget
    implements Presenter {
  late VM viewModel;
  final viewDidApearing = PublishSubject();
  bool _isLoading = false;
  @override
  void initState() {
    viewModel = widget.viewModel;
    performBinding();
    super.initState();
    viewDidApearing.add(1);
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
