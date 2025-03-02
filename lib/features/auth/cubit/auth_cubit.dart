import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/cubit/auth_states.dart';
import 'package:movies_app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:movies_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/repositories/auth_repositorie.dart';
import 'package:movies_app/service/service_locator.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  final _authRepositorie = AuthRepositorie(
    getIt.get<AuthRemoteDataSource>(),
    getIt.get<AuthLocalDataSource>(),
  );
  Future<void> regsiter(RegisterRequest registerRequest) async {
    try {
      emit(RegisterLoading());
      final registerResponse = await _authRepositorie.register(registerRequest);
      emit(RegisterSuccess(registerResponse));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  Future<void> login(LoginRequest loginRequest) async {
    try {
      emit(LoginLoading());
      final loginResponse = await _authRepositorie.login(loginRequest);
      emit(LoginSuccess(loginResponse));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
