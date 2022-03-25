import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data_model.dart';

//https://jsonplaceholder.typicode.com/photos
enum ApiMethod { post, get }

class ApiManageImpl {
  static Future<Stream<T>> request<T>(ApiMethod method, String url,
      String parameter, Map<String, String> header) async* {
    http.Response response;
    switch (method) {
      case ApiMethod.get:
        response = await http.get(Uri.parse(url), headers: header);
        break;
      case ApiMethod.post:
        response =
            await http.post(Uri.parse(url), headers: header, body: parameter);
    }
  }
}

Stream<List<Album>> fetchAlbum() async* {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    log(response.body);
    Iterable l = json.decode(response.body);
    yield List<Album>.from(l.map((model) => Album.fromJson(model)));
  } else {
    throw Exception('Failed to load album');
  }
}
