import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/domain/entities/token.dart';
import 'package:movies_app/features/auth/domain/entities/user.dart';

abstract class AuthRepositorie {
  Future<Either<Faliure, User>> register(RegisterRequest registerUser);
  Future<Either<Faliure, Token>> login(LoginRequest loginUser);
}
