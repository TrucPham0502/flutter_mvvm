import '../rx/activity_indicator.dart';
import '../rx/disposable_widget.dart';
import '../rx/error_tracker.dart';

abstract class BaseViewModel<I, O> with DisposableWidget {
  final ErrorTracker errorTracker = ErrorTracker();
  final ActivityIndicator activityIndicator = ActivityIndicator();
  O transform(I input);
}
