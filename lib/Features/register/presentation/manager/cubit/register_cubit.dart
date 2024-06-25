import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_shope/Features/register/data/repos/repo.dart';
import 'package:smile_shope/Features/register/presentation/manager/cubit/register_state.dart';
import 'package:smile_shope/shared/components/components.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());
  //Sign Up Form key
  GlobalKey<FormState> registerFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController registerNameController = TextEditingController();
  //Sign up Adress
  TextEditingController registerAdressController = TextEditingController();
  //Sign up phone number
  TextEditingController registerPhoneNumberController = TextEditingController();
  //Sign up email
  TextEditingController registerEmailController = TextEditingController();
  //Sign up emailveried
  TextEditingController registeremailverifiedatController =
      TextEditingController();
  //Sign up password
  TextEditingController registerPasswordController = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPasswordController = TextEditingController();

  RegisterRepo registerRepo;
  void registercubit(context) async {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      final response = await registerRepo.register(
          registerNameController.text,
          registerEmailController.text,
          registerPasswordController.text,
          registerPasswordController.text,
          registerAdressController.text,
          registerPhoneNumberController.text,
          registeremailverifiedatController.text);
      response.fold((errMessage) {
        emit(RegisterFailerState(error: errMessage));
        message(context, errMessage.toString());
      }, (register) {
        register = register;
        emit(RegisterSuccessState());
        message(context, '✔تم تسجيل الدخول  بنجاح');
        clearForm();
      });
    } else {
      message(context, 'يوجد حقل فارغ');
    }
  }

  void clearForm() {
    registerNameController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    registerPasswordController.clear();
    registerAdressController.clear();
    registerPhoneNumberController.clear();
    registeremailverifiedatController.clear();
    emit(RegisterClearState());
  }
}
