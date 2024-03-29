import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/core/domain/model/api_response.dart';
import 'package:rxdart/rxdart.dart';

import '../error/error.dart';

class BehaviorProperty<T> {
  BehaviorProperty(T value) {
    _value = value;
    _subject = BehaviorSubject<T>.seeded(value);
  }
  late T _value;
  T get value => _value;
  late BehaviorSubject<T> _subject;
  BehaviorSubject<T> asStream() {
    return _subject;
  }
  void add(T value) {
    _value = value;
    _subject.add(value);
  }
}

extension DataTrackerStreamSubscriton<T> on Stream<ApiResponse<T>> {
  Stream<T> validate() {
    return map((event) {
      if (event.resultCode == StatusCode.success.value) {
        return event.data;
      } else {
        throw ApiError(message: event.message, code: event.resultCode);
      }
    });
  }
}

extension ListDataTrackerStreamSubscriton<T> on Stream<ApiListResponse<T>> {
  Stream<List<T>> validate() {
    return map((event) {
      if (event.resultCode == StatusCode.success.value) {
        return event.data;
      } else {
        throw ApiError(message: event.message, code: event.resultCode);
      }
    });
  }
}

extension AppStream<T> on Stream<T> {
  StreamSubscription<T> drive(BehaviorProperty<T> data) {
    return listen((event) {
      data.add(event);
    });
  }
}

extension AppWidget<T> on Widget {
  StreamBuilder<T> setState(BehaviorProperty<T> data, T? initialData) {
    return StreamBuilder(
        initialData: initialData,
        stream: data.asStream(),
        builder: (context, snap) {
          return this;
        });
  }
}
