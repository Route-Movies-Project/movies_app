import 'package:movies_app/features/auth/domain/entities/token.dart';

class LoginResponse {
  final String message;
  final String token;

  const LoginResponse({required this.message, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String,
        token: json['data'] as String,
      );

  Token toEntity() => Token(token: token);
}
