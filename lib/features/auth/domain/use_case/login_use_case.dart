import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/domain/entities/token.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repositorie.dart';

@singleton
class LoginUseCase {
  final AuthRepositorie _authRepositorie;

  LoginUseCase(this._authRepositorie);
  Future<Either<Faliure, Token>> call(LoginRequest loginUser) =>
      _authRepositorie.login(loginUser);
}
