import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/domain/repositories/auth_repositorie.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';

@singleton
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
      (user) => emit(
        RegisterSuccess(user),
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
      (token) => emit(
        LoginSuccess(token),
      ),
    );
  }
}
