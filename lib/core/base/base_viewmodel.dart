import '../rx/activity_indicator.dart';
import '../rx/disposable_widget.dart';
import '../rx/error_tracker.dart';

class BaseViewModel with DisposableWidget {
  ErrorTracker errorTracker = ErrorTracker();
  ActivityIndicator activityIndicator = ActivityIndicator();
}
