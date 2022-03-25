import 'package:rxdart/rxdart.dart';

class ErrorTracker {
  final PublishSubject<Object> _subject = PublishSubject<Object>();
  Stream<T> trackError<T>(Stream<T> source) {
    return source
        .doOnError((p0, p1) => onError(p0, p1))
        .doOnCancel(() => onCancel)
        .doOnDone(() {});
  }

  void onError(Object error, StackTrace track) {
    _subject.add(error);
  }

  Stream<Object> asStream() {
    return _subject;
  }

  void onCancel() {
    _subject.close();
  }
}

extension ErrorStreamSubscriton<T> on Stream<T> {
  Stream<T> trackError(ErrorTracker errorTracker) {
    return errorTracker.trackError<T>(this);
  }
}
