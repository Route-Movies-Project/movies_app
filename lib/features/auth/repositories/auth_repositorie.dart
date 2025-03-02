import 'dart:developer';

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
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    final repsonse = await _authRemoteDataSource.register(registerRequest);
    return repsonse;
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final resposne = await _authRemoteDataSource.login(loginRequest);
    log("token: ${resposne.data}");
    _authLocalDataSource.saveToken(resposne.data);
    return resposne;
  }
}
