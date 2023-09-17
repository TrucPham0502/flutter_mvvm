import 'package:mvvm/core/base/app_base_viewmodel.dart';
import 'package:mvvm/core/rx/activity_indicator.dart';
import 'package:mvvm/core/rx/error_tracker.dart';
import 'package:mvvm/core/service/progress_hub.dart';
import 'package:rxdart/rxdart.dart';
import '../rx/disposable_widget.dart';

import 'package:flutter/material.dart';

import 'app_base_page.dart';

abstract class BasePage<VM extends AppBaseViewModel> extends AppBasePage with DisposableWidget  {
  final VM viewModel;
  late ErrorTracker errorTracker;
  late ActivityIndicator activityIndicator;
  final stateLoaded = PublishSubject();
  late BuildContext loaderContext;
  BasePage({required this.viewModel});
  
  @override
  void initState() {
    performBinding();
    super.initState();
    stateLoaded.add(1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appNavigation(context),
        body: appBody(context),
      ),
    );
  }

  PreferredSizeWidget? appNavigation(BuildContext context) {
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

  void performBinding() {
    errorTracker = viewModel.errorTracker;
    activityIndicator = viewModel.activityIndicator;
    errorTracker.asStream().listen((event) {
      handleError(event);
    }).canceledBy(this);
    activityIndicator.asStream().listen((event) {
      if (event) {
        Loader.shared.show();
      } else {
        Loader.shared.hide();
      }
    }).canceledBy(this);
  }

  @override
  void dispose() {
    viewModel.cancelSubscriptions();
    cancelSubscriptions();
    super.dispose();
  }
}
