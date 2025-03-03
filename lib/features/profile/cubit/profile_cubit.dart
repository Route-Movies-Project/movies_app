import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/features/profile/cubit/profile_states.dart';
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:movies_app/features/profile/data/model/reset_request.dart';
import 'package:movies_app/features/profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/profile/repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  final ProfileRepository _profilerepository = ProfileRepository(
    getIt.get<ProfileDataSource>(),
  );
  Future<void> updateProfile(UpdateProfileRequest updateProfileRequest) async {
    try {
      emit(UpdateProfileLoading());
      final updateProfileResponse =
          await _profilerepository.updateProfile(updateProfileRequest);
      emit(UpdateProfileSuccess(updateProfileResponse.message));
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  Future<void> deleteProfile() async {
    try {
      emit(DeleteProfileLoading());
      final deleteProfileResponse = await _profilerepository.deleteProfile();
      emit(DeleteProfileSuccess(deleteProfileResponse.message));
    } catch (e) {
      emit(DeleteProfileError(e.toString()));
    }
  }

  Future<void> getProfile() async {
    try {
      emit(ProfileLoading());
      final profileResponse = await _profilerepository.getProfile();
      emit(ProfileSuccess(profileResponse.data));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> resetPassword(ResetRequest resetRequest) async {
    try {
      emit(ResetLoading());
      final resetResponse =
          await _profilerepository.resetPassword(resetRequest);
      emit(ResetSuccess(resetResponse));
    } catch (e) {
      emit(ResetError(e.toString()));
    }
  }
}
