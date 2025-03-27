import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  @Named('MainDio')
  Dio get mainDio => Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          receiveDataWhenStatusError: true,
        ),
      );
  @singleton
  @Named('MovieDio')
  Dio get movieDio => Dio(
        BaseOptions(
          baseUrl: ApiConstants.basicYtsUrl,
          receiveDataWhenStatusError: true,
        ),
      );

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
