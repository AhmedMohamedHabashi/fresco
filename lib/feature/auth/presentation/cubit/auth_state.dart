sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class SignUpSuccess extends AuthState {}

class LogoutSuccess extends AuthState {}

class AuthError extends AuthState {
  final String errMsg;

  AuthError(this.errMsg);
}
