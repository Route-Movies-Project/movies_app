import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/api_error_handler.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/login_response.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/data/model/register_response.dart';
import 'package:movies_app/core/utils/constants/apis.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiDataSource implements AuthRemoteDataSource {
  final Dio _mainDio;

  const AuthApiDataSource(
    @Named('MainDio') this._mainDio,
  );

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _mainDio.post(
        ApiConstants.baseUrl + ApiConstants.registerEndPoint,
        data: registerRequest.toJson(),
      );

      return RegisterResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiErrorHandler.handleDioError(error);
    } catch (error) {
      throw RemoteExpetion(error.toString());
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _mainDio.post(
        ApiConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiErrorHandler.handleDioError(error);
    } catch (error) {
      throw RemoteExpetion(error.toString());
    }
  }
}
