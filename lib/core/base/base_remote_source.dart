import 'dart:convert';

class BaseRemoteSource {
  List<T> stringToList<T>(
      String response, T Function(Map<String, dynamic>) convert) {
    Iterable l = json.decode(response);
    List<T> res = List<T>.from(l.map((model) => convert(model)));
    return res;
  }

  List<T> iterableToList<T>(
      Iterable l, T Function(Map<String, dynamic>) convert) {
    List<T> res = List<T>.from(l.map((model) => convert(model)));
    return res;
  }
}
