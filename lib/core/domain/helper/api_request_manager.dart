import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mvvm/core/error/error.dart';

enum ApiMethod { post, get }

class ApiRequestManager {
  static Stream<T> request<T>(
      {required ApiMethod method,
      required String url,
      required T Function(String) convert,
      String? parameter,
      Map<String, String>? header}) async* {
    final http.Response response;
    Map<String, String> _header = {'Content-type': 'application/json'};
    if (header != null) {
      _header.addAll(header);
    }
    switch (method) {
      case ApiMethod.get:
        response = await http.get(Uri.parse(url), headers: _header);
        break;
      case ApiMethod.post:
        response =
            await http.post(Uri.parse(url), headers: _header, body: parameter);
    }
    if (200 <= response.statusCode && response.statusCode <= 299) {
      log(response.body);
      yield convert(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      throw ResponseError(
          message: "Response Error ${response.statusCode}",
          code: response.statusCode);
    }
  }
}
