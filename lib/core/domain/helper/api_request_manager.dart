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
        response =
            await http.post(Uri.parse(url), headers: header, body: parameter);
    }
    if (response.statusCode == 200) {
      log(response.body);
      yield convert(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<T> convertToList<T>(
      String response, T Function(Map<String, dynamic>) convert) {
    Iterable l = json.decode(response);
    List<T> res = List<T>.from(l.map((model) => convert(model)));
    return res;
  }
}
