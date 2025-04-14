import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/domain/entities/user.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repositorie.dart';

@singleton
class RegisterUseCase {
  final AuthRepositorie _authRepositorie;

  RegisterUseCase(this._authRepositorie);
  Future<Either<Faliure, User>> call(RegisterRequest registerUser) =>
      _authRepositorie.register(registerUser);
}
