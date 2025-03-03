import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/update-profile/cubit/update_profile_states.dart';
import 'package:movies_app/features/update-profile/data/data_source/update_profile_data_source.dart';
import 'package:movies_app/features/update-profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/update-profile/repository/update_profile_repository.dart';
import 'package:movies_app/service/service_locator.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  final UpdateProfileRepository _updateProfilerepository =
      UpdateProfileRepository(
    getIt.get<UpdateProfileDataSource>(),
  );
  Future<void> updateProfile(UpdateProfileRequest updateProfileRequest) async {
    try {
      emit(UpdateProfileLoading());
      final updateProfileResponse =
          await _updateProfilerepository.updateProfile(updateProfileRequest);
      emit(UpdateProfileSuccess(updateProfileResponse.message));
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteProfile() async {
    try {
      emit(DeleteProfileLoading());
      final deleteProfileResponse =
          await _updateProfilerepository.deleteProfile();
      emit(DeleteProfileSuccess(deleteProfileResponse.message));
    } catch (e) {
      emit(DeleteProfileError(e.toString()));
    }
  }
}
