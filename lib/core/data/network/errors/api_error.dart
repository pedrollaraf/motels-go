class ApiError {
  final String errorCode;
  final String errorMessage;
  final String requestPath;
  final List<String> detailedMessages;
  final int? statusCode;

  ApiError({
    required this.errorCode,
    required this.errorMessage,
    required this.requestPath,
    required this.detailedMessages,
    this.statusCode,
  });

  factory ApiError.fromMap(Map<String, dynamic> map, {int? statusCode}) {
    return ApiError(
      errorCode: map['errorCode'] ?? 'Unknown Error Code',
      errorMessage: map['errorMessage'] ?? 'Unknown Error Message',
      requestPath: map['requestPath'] ?? '',
      detailedMessages: List<String>.from(map['detailedMessages'] ?? []),
      statusCode: statusCode,
    );
  }

  @override
  String toString() {
    return 'ApiError {errorCode: $errorCode, errorMessage: $errorMessage, requestPath: $requestPath, detailedMessages: $detailedMessages, statusCode: $statusCode}';
  }
}
