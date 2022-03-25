class AppError extends Error {
  String message;
  int code;
  AppError({required this.message, required this.code});
}
