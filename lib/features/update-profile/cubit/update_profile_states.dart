abstract class UpdateProfileStates {}

class UpdateProfileInitial extends UpdateProfileStates {}

class UpdateProfileLoading extends UpdateProfileStates {}

class UpdateProfileSuccess extends UpdateProfileStates {
  final String message;
  UpdateProfileSuccess(this.message);
}

class UpdateProfileError extends UpdateProfileStates {
  final String errorMessage;
  UpdateProfileError(this.errorMessage);
}

class DeleteProfileLoading extends UpdateProfileStates {}

class DeleteProfileSuccess extends UpdateProfileStates {
  final String message;
  DeleteProfileSuccess(this.message);
}

class DeleteProfileError extends UpdateProfileStates {
  final String errorMessage;
  DeleteProfileError(this.errorMessage);
}
