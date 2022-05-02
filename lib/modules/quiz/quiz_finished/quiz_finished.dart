import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/models.dart' as quizModel;
import 'package:nit_quiz/model/question_model.dart';
import 'package:nit_quiz/modules/Login/login_screen.dart';
import 'package:nit_quiz/modules/home/HomeScreen.dart';
import 'package:nit_quiz/modules/quiz/quiz_finished/cubit/cubit.dart';
import 'package:nit_quiz/modules/quiz/quiz_finished/cubit/states.dart';
import 'package:nit_quiz/shared/components/components.dart';
import 'package:nit_quiz/shared/components/constants.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';

class QuizFinished extends StatelessWidget {
  int score;
  //Quiz quiz;
  QuizFinished({required this.score});

  @override
  Widget build(BuildContext context) {
    QuizFinishedCubit cubit=QuizFinishedCubit.get(context);
    return BlocConsumer<QuizFinishedCubit, QuizFinishedStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: MyColors.defaultColor,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 30),
                                child: defaultIconButton(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width:  MediaQuery.of(context).size.width*0.13,
                                    radius: 9,
                                    color: MyColors.defaultColor,
                                    onPressed: (){
                                     cubit.logOutClick(context);
                                    },
                                    icon:'assets/images/power.png'),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                          'HI name \nYou just finished your quiz ',
                          style: TextStyle(color: MyColors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                child: Text(
                                  'Grade: ${score.toString()}/5',
                                  style: TextStyle(color: MyColors.black),
                                ),
                              ),
                              decoration: BoxDecoration(
                                 border: Border.all(color: MyColors.black),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: MyColors.black, //New
                                      blurRadius: 3.0,
                                      offset: const Offset(2.0, 2.0))
                                ],
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: defaultIconButton(
                                    height: MediaQuery.of(context).size.height*0.05,
                                    width:  MediaQuery.of(context).size.width*0.13,
                                    radius: 9,
                                    color: MyColors.defaultColor,
                                    onPressed: (){
                                      navigateAndFinish(context, HomeScreen());
                                      cubit.clearAnswer(quizModel.quizData);
                                    },
                                    icon:'assets/images/home.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
