class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

class RegisterFailerState extends RegisterState {
  final String error;

  RegisterFailerState({required this.error});
}

final class RegisterClearState extends RegisterState {}
