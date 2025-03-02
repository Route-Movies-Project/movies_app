import 'package:movies_app/features/auth/data/model/login_response.dart';
import 'package:movies_app/features/auth/data/model/register_response.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class RegisterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {
  final RegisterResponse registerResponse;
  RegisterSuccess(this.registerResponse);
}

class RegisterError extends AuthStates {
  final String errorMessage;
  RegisterError(this.errorMessage);
}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final LoginResponse loginResponse;
  LoginSuccess(this.loginResponse);
}

class LoginError extends AuthStates {
  final String errorMessage;
  LoginError(this.errorMessage);
}
