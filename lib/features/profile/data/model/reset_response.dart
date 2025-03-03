class ResetResponse {
  final String message;

  ResetResponse({required this.message});

  factory ResetResponse.fromJson(Map<String, dynamic> json) {
    return ResetResponse(message: json['message']);
  }
}
