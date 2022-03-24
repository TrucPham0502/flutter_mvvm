import 'extension.dart';

class BaseViewModel with DisposableWidget {
  ErrorTracker errorTracker = ErrorTracker();
  ActivityIndicator activityIndicator = ActivityIndicator();
}
