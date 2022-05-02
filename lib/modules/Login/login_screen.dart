import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:nit_quiz/modules/Login/cubit/cubit.dart';
import 'package:nit_quiz/modules/home/HomeScreen.dart';
import 'package:nit_quiz/modules/Login/cubit/states.dart';
import 'package:nit_quiz/modules/quiz/quiz_in_progress/cubit/cubit.dart';
import 'package:nit_quiz/modules/sign_up/sigup_screen.dart';
import 'package:nit_quiz/shared/components/components.dart';
import 'package:nit_quiz/shared/components/constants.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';
import 'package:nit_quiz/shared/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(
            text: state.error,
            state: ToastStates.ERROR,
          );
        }
        if (state is LoginSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            navigateAndFinish(
              context,
              HomeScreen(),
            );
          });
          QuizProgressCubit.get(context).i = 0;
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
      buildWhen: (current, next) {
        if (next is GoogleSuccessState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: MyColors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Image(
                              image: AssetImage('assets/images/logo.png'))),
                      defaultFormField(
                          width: MediaQuery.of(context).size.width * 0.9,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return kEmailNullError;
                            } else if (!emailValidatorRegExp.hasMatch(value)) {
                              return kInvalidEmailError;
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      defaultFormField(
                        width: MediaQuery.of(context).size.width * 0.9,
                        controller: passwordController,
                        label: 'Password',
                        prefix: Icons.lock,
                        suffix: cubit.isPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        obscureText: cubit.isPassword,
                        suffixPressed: cubit.shownSuffix,
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      defaultButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                            navigateTo(context, HomeScreen());
                          }
                        },
                        text: 'Login',
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: MyColors.defaultColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('don\'t have an account ? '),
                          defaultTextButton(
                              onPressed: () {
                                navigateTo(context, SignUpScreen());
                              },
                              text: 'Register Now')
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultIconButton(
                            onPressed: () {
                              //cubit.facebookSign();
                            },
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: MyColors.facebookButtonColor,
                            icon: 'assets/images/facebook.png',
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1),
                          defaultIconButton(
                            onPressed: () {
                            //  cubit.googleSign();
                            },
                            icon: 'assets/images/google.png',
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: MyColors.googleButtonColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
