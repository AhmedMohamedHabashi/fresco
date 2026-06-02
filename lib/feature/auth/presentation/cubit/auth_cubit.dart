import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/auth/data/service/auth_service.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(AuthInitial());
  final AuthService _authService;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    emit(AuthLoading());
    try {
      await _authService.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
        address: address,
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _authService.login(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _authService.logout();
      emit(LogoutSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
