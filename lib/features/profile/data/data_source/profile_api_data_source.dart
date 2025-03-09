import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constants/apis.dart';
import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:movies_app/features/profile/data/model/delete_profile_response.dart';
import 'package:movies_app/features/profile/data/model/profile_response.dart';
import 'package:movies_app/features/profile/data/model/reset_request.dart';
import 'package:movies_app/features/profile/data/model/reset_response.dart';
import 'package:movies_app/features/profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/profile/data/model/update_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: ProfileDataSource)
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
        throw RemoteExpetion(response.data["messsage"]);
      }
    } on DioException catch (e) {
      throw RemoteExpetion(
          e.response?.data["message"] ?? 'Failed To Update Profile');
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
      throw RemoteExpetion(
          e.response?.data["message"] ?? 'Failed To Delete Profile');
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
      throw RemoteExpetion(
          e.response?.data["message"] ?? 'Failed To get Profile');
    }
  }

  @override
  Future<ResetResponse> resetPassword(
      ResetRequest request, String token) async {
    try {
      final response = await _dio.patch(
        ApiConstants.resetPasswordEndPoint,
        data: request.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return ResetResponse.fromJson(response.data);
      } else {
        throw RemoteExpetion(
            response.data['message'] ?? 'Failed to reset password');
      }
    } on DioException catch (error) {
      throw RemoteExpetion(
        error.response?.data['message'] ?? 'An unexpected error occurred',
      );
    }
  }
}
