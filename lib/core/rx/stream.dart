import 'package:mvvm/core/domain/model/api_response.dart';
import 'package:rxdart/rxdart.dart';

import '../error/error.dart';

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

extension DataTrackerStreamSubscriton<T> on Stream<ApiResponse<T>> {
  Stream<T> trackData() {
    return map((event) {
      if (event.resultCode == ApiResponse.Success) {
        return event.data;
      } else {
        throw ApiError(message: event.message, code: event.resultCode);
      }
    });
  }
}
