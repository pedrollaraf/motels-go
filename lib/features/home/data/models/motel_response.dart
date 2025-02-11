import 'package:moteis_go/features/home/data/models.dart';

class MotelResponse {
  final bool success;
  final MotelData data;
  final List<dynamic> message;

  MotelResponse({
    required this.success,
    required this.data,
    required this.message,
  });

  factory MotelResponse.fromJson(Map<String, dynamic> json) {
    return MotelResponse(
      success: json['sucesso'] ?? false,
      data: MotelData.fromJson(json['data'] ?? {}),
      message: json['mensagem'] ?? [],
    );
  }
}
