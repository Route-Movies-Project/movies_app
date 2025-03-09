import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/faliure.dart';
import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:movies_app/features/profile/data/model/delete_profile_response.dart';
import 'package:movies_app/features/profile/data/model/profile_response.dart';
import 'package:movies_app/features/profile/data/model/reset_request.dart';
import 'package:movies_app/features/profile/data/model/reset_response.dart';
import 'package:movies_app/features/profile/data/model/update_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/update_profile_request.dart';

@singleton
class ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepository(this._profileDataSource);

  Future<Either<Faliure, UpdateProfileResponse>> updateProfile(
    UpdateProfileRequest updateProfileRequest,
  ) async {
    try {
      final response =
          await _profileDataSource.updateProfile(updateProfileRequest);
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, DeleteProfileResponse>> deleteProfile() async {
    try {
      final response = await _profileDataSource.deleteProfile();
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, ProfileResponse>> getProfile() async {
    try {
      final response = await _profileDataSource.getProfile();
      return Right(response);
    } on RemoteExpetion catch (e) {
      return Left(Faliure(e.message));
    }
  }

  Future<Either<Faliure, ResetResponse>> resetPassword(
      ResetRequest resetRequest) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(SharedPrefsConstants.tokenKey);
      final response = await _profileDataSource.resetPassword(
        resetRequest,
        token!,
      );
      return Right(response);
    } on MoviesAppExceptions catch (e) {
      return Left(Faliure(e.message));
    }
  }
}
