import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/login_response.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/data/model/register_response.dart';

class AuthRepositorie {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositorie(this._authRemoteDataSource, this._authLocalDataSource);
  Future<Either<Faliure, RegisterResponse>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final repsonse = await _authRemoteDataSource.register(registerRequest);
      return Right(repsonse);
    } on MoviesAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, LoginResponse>> login(
      LoginRequest loginRequest) async {
    try {
      final response = await _authRemoteDataSource.login(loginRequest);
      log("token: ${response.data}");
      _authLocalDataSource.saveToken(response.data);
      return Right(response);
    } on MoviesAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
