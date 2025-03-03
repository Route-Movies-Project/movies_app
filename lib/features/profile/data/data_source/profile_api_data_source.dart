import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:movies_app/features/profile/data/model/delete_profile_response.dart';
import 'package:movies_app/features/profile/data/model/profile_response.dart';
import 'package:movies_app/features/profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/profile/data/model/update_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApiDataSource implements ProfileDataSource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _dio.patch(
        ApiConstants.profileEndPoint,
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
  Future<DeleteProfileResponse> deleteProfile() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final response = await _dio.delete(
        ApiConstants.profileEndPoint,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer ${prefs.getString(SharedPrefsConstants.tokenKey)}"
          },
        ),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return DeleteProfileResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to Update Profile");
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? '');
    }
  }

  @override
  Future<ProfileResponse> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = await _dio.get(
        ApiConstants.profileEndPoint,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${prefs.getString(SharedPrefsConstants.tokenKey)}"
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileResponse.fromJson(response.data);
      } else {
        throw Exception("Failed To Get Profile");
      }
    } on DioException catch (e) {
      throw Exception(e.response!.data["message"] ?? '');
    }
  }
}
