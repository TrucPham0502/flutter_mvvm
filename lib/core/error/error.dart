class AppError extends Error {
  String message;
  int code;
  AppError({required this.message, required this.code});
}

class ApiError extends AppError {
  ApiError({required String message, required int code})
      : super(message: message, code: code);
}
