import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/login_response.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/data/model/register_response.dart';
import 'package:movies_app/core/utils/constants/apis.dart';

class AuthApiDataSource implements AuthRemoteDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.baseUrl + ApiConstants.registerEndPoint,
        data: registerRequest.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return RegisterResponse.fromJson(response.data);
      } else {
        throw RemoteExpetion(response.data["message"]);
      }
    } on DioException catch (error) {
      throw RemoteExpetion(
        error.response?.data["message"] ?? 'Failed To Register',
      );
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: loginRequest.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw RemoteExpetion(response.data["message"]);
      }
    } on DioException catch (error) {
      throw RemoteExpetion(
        error.response?.data["message"] ?? 'Failed To Login',
      );
    }
  }
}
