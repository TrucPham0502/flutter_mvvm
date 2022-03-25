import 'package:flutter/material.dart';
import 'package:mvvm/core/base/base_state_page.dart';
import 'package:mvvm/core/base/base_viewmodel.dart';

import '../rx/activity_indicator.dart';
import '../rx/error_tracker.dart';

abstract class BaseStatefulWidgetPage<VM extends BaseViewModel>
    extends StatefulWidget implements Presenter {
  BaseStatefulWidgetPage({Key? key}) : super(key: key);
  late ErrorTracker errorTracker;
  late ActivityIndicator activityIndicator;
  VM get viewModel;
}
