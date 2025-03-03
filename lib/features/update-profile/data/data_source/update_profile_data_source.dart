import 'package:movies_app/features/update-profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/update-profile/data/model/update_profile_response.dart';

abstract class UpdateProfileDataSource {
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  );
  Future<UpdateProfileResponse> deleteProfile();
}
