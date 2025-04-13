import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/mappers/token_mapper.dart';
import 'package:movies_app/features/auth/data/mappers/user_mapper.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/domain/entities/token.dart';
import 'package:movies_app/features/auth/domain/entities/user.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repositorie.dart';

@Singleton(as: AuthRepositorie)
class AuthRepositorieImpl implements AuthRepositorie {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositorieImpl(this._authRemoteDataSource, this._authLocalDataSource);
  @override
  Future<Either<Faliure, User>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final repsonse = await _authRemoteDataSource.register(registerRequest);
      return Right(repsonse.user.toEntity);
    } on MoviesAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }

  @override
  Future<Either<Faliure, Token>> login(LoginRequest loginRequest) async {
    try {
      final response = await _authRemoteDataSource.login(loginRequest);
      _authLocalDataSource.saveToken(response.token);
      log(await _authLocalDataSource.getToken());
      return Right(response.toEntity);
    } on MoviesAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
