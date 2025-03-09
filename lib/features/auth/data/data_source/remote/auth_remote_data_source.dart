import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/login_response.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/data/model/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<LoginResponse> login(LoginRequest loginRequest);
}
