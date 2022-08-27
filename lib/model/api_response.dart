class ApiResponse<T> {
  final String message;
  final bool status;
  T? model;

  ApiResponse({
    required this.message,
    required this.status,
    this.model,
  });
}
