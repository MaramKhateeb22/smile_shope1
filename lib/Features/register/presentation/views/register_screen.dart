import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/already_have_an_account_widget.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/custom_form_button.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/custom_input_field.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/page_header.dart';
import 'package:smile_shope/Features/login/presentation/views/widgets/page_heading.dart';
import 'package:smile_shope/Features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:smile_shope/Features/register/presentation/manager/cubit/register_state.dart';
import 'package:smile_shope/cache/cache_helper.dart';
import 'package:smile_shope/layout/homeScreen.dart';
import 'package:smile_shope/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SmileShopeHomeScreen(),
              ),
            );
            CacheHelper().saveData(key: 'isRegister', value: true);
          }
          if (state is RegisterFailerState) {
            message(context, state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: SingleChildScrollView(
              child: Form(
                key: context.read<RegisterCubit>().registerFormKey,
                child: Column(
                  children: [
                    const PageHeader(),
                    const PageHeading(title: 'Sign-up'),
                    //! Image
                    // const PickImageWidget(),
                    const SizedBox(height: 16),
                    //! Name
                    CustomInputField(
                      labelText: 'Name',
                      hintText: 'Your Name',
                      isDense: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required!';
                        }
                        return null;
                      },
                      controller:
                          context.read<RegisterCubit>().registerNameController,
                    ),
                    const SizedBox(height: 16),

                    //!Email
                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      isDense: true,
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
                      controller:
                          context.read<RegisterCubit>().registerEmailController,
                    ),
                    const SizedBox(height: 16),
                    //!Email  email_verified_at
                    CustomInputField(
                      labelText: 'Email Verified',
                      hintText: ' email verrified',
                      isDense: true,
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
                      controller: context
                          .read<RegisterCubit>()
                          .registeremailverifiedatController,
                    ),
                    const SizedBox(height: 16),
                    //! Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required!';
                        }
                        return null;
                      },
                      controller: context
                          .read<RegisterCubit>()
                          .registerPasswordController,
                    ),
                    const SizedBox(height: 16),
                    //! Confirm Password
                    CustomInputField(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Your password',
                      isDense: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required!';
                        }
                        return null;
                      },
                      obscureText: true,
                      suffixIcon: true,
                      controller: context
                          .read<RegisterCubit>()
                          .confirmPasswordController,
                    ),
                    const SizedBox(height: 22),
                    //! Phone Number
                    CustomInputField(
                      labelText: 'Phone number',
                      hintText: 'Your phone number ex:01234567890',
                      isDense: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required!';
                        }
                        return null;
                      },
                      controller: context
                          .read<RegisterCubit>()
                          .registerPhoneNumberController,
                    ),
                    const SizedBox(height: 16),
                    //! Adress
                    CustomInputField(
                      labelText: 'Adress',
                      hintText: 'Your Adress',
                      isDense: true,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required!';
                        }
                        return null;
                      },
                      controller: context
                          .read<RegisterCubit>()
                          .registerAdressController,
                    ),
                    const SizedBox(height: 16),
                    //!Sign Up Button
                    state is RegisterLoadingState
                        ? const CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: 'Signup',
                            onPressed: () {
                              context
                                  .read<RegisterCubit>()
                                  .registercubit(context);
                            },
                          ),
                    const SizedBox(height: 18),
                    //! Already have an account widget
                    const AlreadyHaveAnAccountWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
