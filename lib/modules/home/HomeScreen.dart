import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/question_model.dart';
import 'package:nit_quiz/model/quiz_model.dart';
import 'package:nit_quiz/modules/Login/login_screen.dart';
import 'package:nit_quiz/modules/quiz/quiz_in_progress/cubit/cubit.dart';
import 'package:nit_quiz/modules/quiz/start_quiz/start_quiz_screen.dart';
import 'package:nit_quiz/shared/components/components.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';
import 'package:nit_quiz/shared/local/applocal.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Quiz quiz;
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          QuizProgressCubit.get(context).i = 0;
          // QuizProgressCubit.get(context).i= 0;

          return SafeArea(
            child: Scaffold(
              backgroundColor: MyColors.defaultColor,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Text(
                              'Start Quiz Just when you are reedy.',
                              style: TextStyle(
                                  color: MyColors.facebookButtonColor),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2, color: MyColors.defaultColor)),
                            // borderRadius: BorderRadius.circular(5),
                            color: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Center(
                              child: ListView.builder(
                                itemCount: quizData.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ListTile(
                                  title: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: Center(
                                      child: Text(
                                        quizData[index].name!,
                                        style: TextStyle(color: MyColors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.defaultColor),
                                      borderRadius: BorderRadius.circular(25),
                                      color: MyColors.defaultColor,
                                    ),
                                  ),
                                  onTap: () {
                                    navigateAndFinish(
                                        context, StartQuizScreen(i: index));
                                    // navigateAndFinish
                                  },
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: MyColors.facebookButtonColor),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: MyColors.black, //New
                                    blurRadius: 12.0,
                                    offset: const Offset(2.0, 2.0))
                              ],
                              color: MyColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColors.facebookButtonColor),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: MyColors.black, //New
                            blurRadius: 12.0,
                            offset: const Offset(2.0, 2.0))
                      ],
                      color: MyColors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
