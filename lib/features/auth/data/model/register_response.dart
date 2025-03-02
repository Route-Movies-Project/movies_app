import 'register_response_data.dart';

class RegisterResponse {
  final String message;
  final UserModel data;

  const RegisterResponse({
    required this.message,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String,
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
