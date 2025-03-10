import 'package:movies_app/features/auth/domain/entities/token.dart';
import 'package:movies_app/features/auth/domain/entities/user.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class RegisterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {
  final User user;
  RegisterSuccess(this.user);
}

class RegisterError extends AuthStates {
  final String errorMessage;
  RegisterError(this.errorMessage);
}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final Token token;
  LoginSuccess(this.token);
}

class LoginError extends AuthStates {
  final String errorMessage;
  LoginError(this.errorMessage);
}
