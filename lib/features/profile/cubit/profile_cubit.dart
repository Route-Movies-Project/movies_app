import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/profile/cubit/profile_states.dart';
import 'package:movies_app/features/profile/data/model/reset_request.dart';
import 'package:movies_app/features/profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/profile/repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._profilerepository) : super(ProfileInitial());

  final ProfileRepository _profilerepository;
  Future<void> updateProfile(UpdateProfileRequest updateProfileRequest) async {
    emit(UpdateProfileLoading());
    final response = await _profilerepository.updateProfile(
      updateProfileRequest,
    );
    response.fold(
      (faliure) => emit(UpdateProfileError(faliure.message)),
      (response) => emit(UpdateProfileSuccess(response.message)),
    );
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());
    final response = await _profilerepository.deleteProfile();
    response.fold(
      (faliure) => emit(DeleteProfileError(faliure.message)),
      (response) => emit(DeleteProfileSuccess(response.message)),
    );
  }

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final response = await _profilerepository.getProfile();
    response.fold(
      (faliure) => emit(ProfileError(faliure.message)),
      (response) => emit(ProfileSuccess(response.data)),
    );
  }

  Future<void> resetPassword(ResetRequest resetRequest) async {
    emit(ResetLoading());
    final response = await _profilerepository.resetPassword(
      resetRequest,
    );
    response.fold(
      (faliure) => emit(ResetError(faliure.message)),
      (response) => emit(ResetSuccess(response)),
    );
  }
}
