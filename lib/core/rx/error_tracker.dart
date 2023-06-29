import 'package:rxdart/rxdart.dart';

class ErrorTracker {
  final PublishSubject<Error> _subject = PublishSubject<Error>();
  Stream<T> trackError<T>(Stream<T> source) {
    return source
        .doOnError((p0, p1) => onError(p0 as Error, p1))
        .doOnCancel(() => onCancel)
        .doOnDone(() {})
        .onErrorResumeNext(const Stream.empty());
  }

  void onError(Error error, StackTrace track) {
    _subject.add(error);
  }

  Stream<Error> asStream() {
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
