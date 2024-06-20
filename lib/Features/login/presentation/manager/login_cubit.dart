import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope/Features/login/data/models/login_model.dart';
import 'package:smile_shope/Features/login/data/repos/repo.dart';
import 'package:smile_shope/Features/login/presentation/manager/login_state.dart';
import 'package:smile_shope/shared/components/components.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  //Sign in Form key
  GlobalKey<FormState> loginFormKey = GlobalKey();
  //Sign in email
  TextEditingController loginEmailController = TextEditingController();
  //Sign in password
  TextEditingController loginPasswordController = TextEditingController();
  LoginRepo loginRepo;
  LoginModel? login;

  void loginCubit(String email, String password, context) async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await loginRepo.login(
        loginEmailController.text,
        loginPasswordController.text,
      );
      response.fold((errMessage) {
        emit(LoginFailerState(error: errMessage));
        message(context, errMessage.toString());
      }, (login) {
        login = login;
        emit(LoginSuccessState());
        message(context, 'تم تسجيل الدخول  بنجاح' '\n ✔المعلومات صحيحة ');
        clearForm();
      });
    } else {
      message(context, 'يوجد حقل فارغ');
    }
  }

  void clearForm() {
    loginEmailController.clear();
    loginPasswordController.clear();

    emit(ClearFormLoginState());
  }
}
