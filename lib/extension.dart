import 'dart:async';
import 'package:rxdart/rxdart.dart';

class BehaviorProperty<T> {
  BehaviorProperty(T value) {
    _value = value;
    subject = BehaviorSubject<T>.seeded(value);
  }
  late T _value;
  T get value => _value;
  late BehaviorSubject<T> subject;
  void add(T value) {
    _value = value;
    subject.add(value);
  }
}

extension DisposableStreamSubscriton on StreamSubscription {
  void canceledBy(DisposableWidget widget) {
    widget.addSubscription(this);
  }
}

class DisposableWidget {
  final List<StreamSubscription> _subscriptions = [];
  void cancelSubscriptions() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
  }

  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
}

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

class AppError extends Error {
  String message;
  int code;
  AppError({required this.message, required this.code});
}
