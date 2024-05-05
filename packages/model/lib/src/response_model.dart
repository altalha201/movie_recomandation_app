class ResponseModel {
  final int statusCode;
  final bool success;
  final Map<String, dynamic>? body;

  ResponseModel({
    required this.statusCode,
    required this.success,
    this.body,
  });
}
