import 'package:movies_app/features/profile/data/model/delete_profile_response.dart';
import 'package:movies_app/features/profile/data/model/profile_response.dart';
import 'package:movies_app/features/profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/profile/data/model/update_profile_response.dart';

abstract class ProfileDataSource {
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  );
  Future<DeleteProfileResponse> deleteProfile();
  Future<ProfileResponse> getProfile();
}
