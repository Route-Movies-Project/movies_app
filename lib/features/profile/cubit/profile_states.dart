import 'package:movies_app/features/profile/data/model/profile_model.dart';
import 'package:movies_app/features/profile/data/model/reset_response.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class UpdateProfileLoading extends ProfileStates {}

class UpdateProfileSuccess extends ProfileStates {
  final String message;
  UpdateProfileSuccess(this.message);
}

class UpdateProfileError extends ProfileStates {
  final String errorMessage;
  UpdateProfileError(this.errorMessage);
}

class DeleteProfileLoading extends ProfileStates {}

class DeleteProfileSuccess extends ProfileStates {
  final String message;
  DeleteProfileSuccess(this.message);
}

class DeleteProfileError extends ProfileStates {
  final String errorMessage;
  DeleteProfileError(this.errorMessage);
}

class ProfileLoading extends ProfileStates {}

class ProfileSuccess extends ProfileStates {
  final ProfileModel data;
  ProfileSuccess(this.data);
}

class ProfileError extends ProfileStates {
  final String errorMessage;
  ProfileError(this.errorMessage);
}

class ResetLoading extends ProfileStates {}

class ResetSuccess extends ProfileStates {
  final ResetResponse resetResponse;
  ResetSuccess(this.resetResponse);
}

class ResetError extends ProfileStates {
  final String errorMessage;
  ResetError(this.errorMessage);
}
