import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope/Features/login/presentation/manager/login_cubit.dart';
import 'package:smile_shope/Features/login/presentation/manager/login_state.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/custom_form_button.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/custom_input_field.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/dont_have_an_account.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/forget_password_widget.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/page_header.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/page_heading.dart';
import 'package:smile_shope/cache/cache_helper.dart';
import 'package:smile_shope/layout/homeScreen.dart';
import 'package:smile_shope/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SmileShopeHomeScreen(),
            ),
          );
          CacheHelper().saveData(key: 'isLogin', value: true);
        }
        if (state is LoginFailerState) {
          message(context, state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: Column(
            children: [
              const PageHeader(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: context.read<LoginCubit>().loginFormKey,
                      child: Column(
                        children: [
                          const PageHeading(title: 'Sign-in'),
                          //!Email
                          CustomInputField(
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'required!';
                              }
                              if (!value.contains('@')) {
                                return ' "الرجاء إدخال بريد إلكتروني صالح. يجب أن يحتوي البريد الإلكتروني على الرمز "@"."';
                                // return ' !@';
                              }
                              return null;
                            },
                            labelText: 'Email',
                            hintText: 'Your email',
                            controller:
                                context.read<LoginCubit>().loginEmailController,
                          ),
                          const SizedBox(height: 16),
                          //!Password
                          CustomInputField(
                            validate: (textValue) {
                              if (textValue == null || textValue.isEmpty) {
                                return 'required!';
                              }
                              return null;
                            },
                            labelText: 'Password',
                            hintText: 'Your password',
                            obscureText: true,
                            suffixIcon: true,
                            controller: context
                                .read<LoginCubit>()
                                .loginPasswordController,
                          ),
                          const SizedBox(height: 16),
                          //! Forget password?
                          ForgetPasswordWidget(size: size),
                          const SizedBox(height: 20),
                          //!Sign In Button
                          state is LoginLoadingState
                              ? const CircularProgressIndicator()
                              : state is LoginFailerState
                                  ? CustomFormButton(
                                      innerText: state.error,
                                      onPressed: () {
                                        message(context, state.error);
                                      })
                                  : CustomFormButton(
                                      innerText: 'Sign In',
                                      onPressed: () {
                                        context.read<LoginCubit>().loginCubit(
                                            context
                                                .read<LoginCubit>()
                                                .loginEmailController
                                                .text,
                                            context
                                                .read<LoginCubit>()
                                                .loginPasswordController
                                                .text,
                                            context);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => const ProfileScreen(),
                                        //   ),
                                        // );
                                      },
                                    ),
                          const SizedBox(height: 18),
                          //! Dont Have An Account ?
                          DontHaveAnAccountWidget(size: size),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
