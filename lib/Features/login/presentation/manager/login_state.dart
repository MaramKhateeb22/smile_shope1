class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailerState extends LoginState {
  final String error;

  LoginFailerState({required this.error});
}


class ClearFormLoginState extends LoginState{}