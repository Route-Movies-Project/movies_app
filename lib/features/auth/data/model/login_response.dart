class LoginResponse {
  final String message;
  final String data;

  const LoginResponse({required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String,
        data: json['data'] as String,
      );
}
