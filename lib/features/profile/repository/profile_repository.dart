import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:movies_app/features/profile/data/model/delete_profile_response.dart';
import 'package:movies_app/features/profile/data/model/profile_response.dart';
import 'package:movies_app/features/profile/data/model/reset_request.dart';
import 'package:movies_app/features/profile/data/model/reset_response.dart';
import 'package:movies_app/features/profile/data/model/update_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/update_profile_request.dart';

class ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepository(this._profileDataSource);

  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    final response =
        await _profileDataSource.updateProfile(updateProfileRequest);
    return response;
  }

  Future<DeleteProfileResponse> deleteProfile() async {
    final response = await _profileDataSource.deleteProfile();
    return response;
  }

  Future<ProfileResponse> getProfile() async {
    final response = await _profileDataSource.getProfile();
    return response;
  }

  
  Future<ResetResponse> resetPassword(ResetRequest resetRequest) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(SharedPrefsConstants.tokenKey);
    final response = await _profileDataSource.resetPassword(resetRequest, token!);
    return response;
  }

}
