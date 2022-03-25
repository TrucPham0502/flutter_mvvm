class ApiResponse<T> {
  String message;
  int resultCode;
  T data;
  ApiResponse(
      {required this.message, required this.resultCode, required this.data});
  factory ApiResponse.fromJson(Map<String, dynamic> json,
          T Function(Map<String, dynamic>) convert) =>
      ApiResponse<T>(
        message: json["message"],
        resultCode: json["resultCode"],
        data: convert(json["data"]),
      );
}
