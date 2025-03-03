import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/update-profile/data/data_source/update_profile_data_source.dart';
import 'package:movies_app/features/update-profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/update-profile/data/model/update_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileApiDataSource implements UpdateProfileDataSource {
  final _dio = Dio(
    BaseOptions(
        baseUrl: ApiConstants.baseUrl, receiveDataWhenStatusError: true),
  );

  @override
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _dio.patch(
        ApiConstants.updateProfileEndPoint,
        data: updateProfileRequest.toJson(),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer ${prefs.getString(SharedPrefsConstants.tokenKey)}"
          },
        ),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return UpdateProfileResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to Update Profile");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? '');
    }
  }

  @override
  Future<UpdateProfileResponse> deleteProfile() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _dio.delete(
        ApiConstants.updateProfileEndPoint,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer ${prefs.getString(SharedPrefsConstants.tokenKey)}"
          },
        ),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return UpdateProfileResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to Update Profile");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? '');
    }
  }
}
