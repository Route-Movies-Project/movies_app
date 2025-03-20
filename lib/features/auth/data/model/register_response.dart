import 'register_response_data.dart';

class RegisterResponse {
  final String message;
  final UserModel user;

  const RegisterResponse({
    required this.message,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: (json["message"] is List) ? json["message"][0] : json["message"],
      user: UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
