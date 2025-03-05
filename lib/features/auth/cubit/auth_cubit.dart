import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/cubit/auth_states.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/repositories/auth_repositorie.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._authRepositorie) : super(AuthInitial());
  final AuthRepositorie _authRepositorie;
  Future<void> regsiter(RegisterRequest registerRequest) async {
    emit(RegisterLoading());
    final response = await _authRepositorie.register(registerRequest);
    response.fold(
      (faliure) => emit(
        RegisterError(faliure.message),
      ),
      (registerResponse) => emit(
        RegisterSuccess(registerResponse),
      ),
    );
  }

  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    final response = await _authRepositorie.login(loginRequest);
    response.fold(
      (faliure) => emit(
        LoginError(faliure.message),
      ),
      (loginResponse) => emit(
        LoginSuccess(loginResponse),
      ),
    );
  }
}
