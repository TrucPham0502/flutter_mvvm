import 'package:rxdart/rxdart.dart';

class ActivityIndicator {
  final PublishSubject<bool> _subject = PublishSubject<bool>();
  Stream<T> trackActivityOfObservable<T>(Stream<T> source) {
    return source.doOnData((event) {
      sendStopLoading();
    }).doOnError((p0, p1) {
      sendStopLoading();
    }).doOnDone(() {
      sendStopLoading();
    }).doOnListen(() {
      sendStartLoading();
    });
  }

  void sendStartLoading() {
    _subject.add(true);
  }

  Stream<bool> asStream() {
    return _subject;
  }

  void sendStopLoading() {
    _subject.add(false);
  }
}

extension ActivityIndicatorStreamSubscriton<T> on Stream<T> {
  Stream<T> trackActivity(ActivityIndicator activityIndicator) {
    return activityIndicator.trackActivityOfObservable<T>(this);
  }
}
