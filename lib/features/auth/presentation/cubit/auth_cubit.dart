import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:movies_app/features/auth/domain/use_case/register_use_case.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';

@singleton
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._registerUseCase, this._loginUseCase) : super(AuthInitial());
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  Future<void> regsiter(RegisterRequest registerRequest) async {
    emit(RegisterLoading());
    final response = await _registerUseCase(registerRequest);
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
    final response = await _loginUseCase(loginRequest);
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
