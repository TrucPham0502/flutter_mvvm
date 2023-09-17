import 'package:mvvm/module/TestModule/viewmodel/detail_viewmodel.dart';

import '../rx/activity_indicator.dart';
import '../rx/disposable_widget.dart';
import '../rx/error_tracker.dart';

abstract class AppBaseViewModel with DisposableWidget {
    final ErrorTracker errorTracker = ErrorTracker();
    final ActivityIndicator activityIndicator = ActivityIndicator();
}