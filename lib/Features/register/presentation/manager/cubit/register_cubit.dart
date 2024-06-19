import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smile_shope/Features/register/presentation/manager/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  //Sign Up Form key
  GlobalKey<FormState> registerFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController registerName = TextEditingController();
  //Sign up phone number
  TextEditingController registerPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController registerEmail = TextEditingController();
  //Sign up password
  TextEditingController registerPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
}
