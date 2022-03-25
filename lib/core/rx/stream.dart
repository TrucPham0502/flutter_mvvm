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
