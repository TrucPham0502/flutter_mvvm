import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum ApiMethod { post, get }

class ApiRequestManager {
  static Stream<T> request<T>(
      {required ApiMethod method,
      required String url,
      required T Function(String) convert,
      String? parameter,
      Map<String, String>? header}) async* {
    final http.Response response;
    switch (method) {
      case ApiMethod.get:
        response = await http.get(Uri.parse(url), headers: header);
        break;
      case ApiMethod.post:
        response = await http.post(Uri.parse(url),
            headers: {'Content-type': 'application/json'}, body: parameter);
    }
    if (200 <= response.statusCode && response.statusCode <= 299) {
      log(response.body);
      yield convert(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<T> stringToList<T>(
      String response, T Function(Map<String, dynamic>) convert) {
    Iterable l = json.decode(response);
    List<T> res = List<T>.from(l.map((model) => convert(model)));
    return res;
  }

  static List<T> iterableToList<T>(
      Iterable l, T Function(Map<String, dynamic>) convert) {
    List<T> res = List<T>.from(l.map((model) => convert(model)));
    return res;
  }
}
