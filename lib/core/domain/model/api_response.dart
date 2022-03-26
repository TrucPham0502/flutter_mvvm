import 'dart:convert';

class ApiResponse<T> {
  static int Success = 1;
  static int Fail = -1;
  String message;
  int resultCode;
  T data;
  ApiResponse(
      {required this.message, required this.resultCode, required this.data});
  factory ApiResponse.fromJson(String response, T Function(dynamic) convert) {
    final res = json.decode(response);
    return ApiResponse<T>(
      message: res["ReturnMessage"],
      resultCode: res["ReturnCode"],
      data: convert(res["Data"]),
    );
  }
}
