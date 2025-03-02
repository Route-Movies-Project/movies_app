import 'package:movies_app/features/update-profile/data/data_source/update_profile_data_source.dart';
import 'package:movies_app/features/update-profile/data/model/update_profile_response.dart';

import '../data/model/update_profile_request.dart';

class UpdateProfileRepository {
  final UpdateProfileDataSource _updateProfileDataSource;

  UpdateProfileRepository(this._updateProfileDataSource);

  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    final response =
        await _updateProfileDataSource.updateProfile(updateProfileRequest);
    return response;
  }
}
