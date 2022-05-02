import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/modules/Login/cubit/cubit.dart';
import 'package:nit_quiz/modules/Login/cubit/states.dart';
import 'package:nit_quiz/modules/Login/login_screen.dart';
import 'package:nit_quiz/modules/home/HomeScreen.dart';
import 'package:nit_quiz/modules/sign_up/cubit/cubit.dart';
import 'package:nit_quiz/modules/sign_up/cubit/states.dart';
import 'package:nit_quiz/shared/components/components.dart';
import 'package:nit_quiz/shared/components/constants.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';
import 'package:nit_quiz/shared/local/cache_helper.dart';

class SignUpScreen extends StatelessWidget {
  // const SignUpScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit =SignUpCubit.get(context);
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (BuildContext context, Object? state) {
        if (state is CreateUserSuccessState) {
          navigateAndFinish(
            context,
            HomeScreen(),
          );
        }
        if (state is GoogleSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            navigateAndFinish(
              context,
              HomeScreen(),
            );
          });
        }
        if (state is FacebookSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            navigateAndFinish(
              context,
              HomeScreen(),
            );
          });
        }
      },
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: MyColors.white,
            body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: const Image(
                                image: AssetImage('assets/images/logo.png'))),
                      ),
                      Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: MyColors.defaultColor,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      defaultFormField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return kNameNullError;
                            }
                            return null;
                          },
                          label: 'UserName',
                          prefix: Icons.person),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      defaultFormField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return kEmailNullError;
                            } else if (!emailValidatorRegExp.hasMatch(value)) {
                              return kInvalidEmailError;
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      defaultFormField(
                        width: MediaQuery.of(context).size.width * 0.9,
                        controller: passwordController,
                        label: 'Password',
                        prefix: Icons.lock_outline_rounded,
                        suffix: cubit.isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: cubit.isPassword,
                        suffixPressed:
                        cubit.togglePasswordView,
                        type: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return kPassNullError;
                          } else if (value.length < 6) {
                            return kShortPassError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      defaultFormField(
                        width: MediaQuery.of(context).size.width * 0.9,
                        controller: confirmPasswordController,
                        label: 'Confirm Password',
                        prefix: Icons.lock_outline_rounded,
                        suffix: cubit.isHiddenPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: SignUpCubit.get(context).isHiddenPassword,
                        suffixPressed: SignUpCubit.get(context).toggleConfirmPasswordView,
                        type: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return kPassNullError;
                          } else if (value != passwordController.text) {
                            return kConfirmPassNullError;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      defaultFormField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return kPhoneNullError;
                            } else if (value.length <= 10) {
                              return kShortPhoneError;
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone_android_outlined),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      BuildCondition(
                        condition: state is! RegisterLoadingState,
                        builder: (BuildContext context)
                        =>defaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //NavigateTo(context, HomeScreen());
                              cubit.userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          text: 'Get Started',
                          width: MediaQuery.of(context).size.width * 0.9,
                          color: MyColors.defaultColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Have an account?'),
                          defaultTextButton(
                              onPressed: () {
                                navigateTo(context, LoginScreen());
                              },
                              text: 'Login')
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultIconButton(
                            onPressed: () {
                              //LoginCubit.get(context).facebookSign();
                            },
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: MyColors.facebookButtonColor,
                            icon: 'assets/images/facebook.png',
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1),
                          defaultIconButton(
                            onPressed: () {
                             // LoginCubit.get(context).googleSign();
                            },
                            icon: 'assets/images/google.png',
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: MyColors.googleButtonColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
