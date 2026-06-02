import 'package:fresco/feature/account/data/model/user_model.dart';

sealed class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final UserModel user;

  AccountLoaded(this.user);
}

class AccountUpdating extends AccountState {}

class AccountUpdated extends AccountState {
  final UserModel user;

  AccountUpdated(this.user);
}

class AccountError extends AccountState {
  final String errMsg;
  AccountError(this.errMsg);
}
