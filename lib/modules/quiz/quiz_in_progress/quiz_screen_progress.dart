import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/models.dart';
import 'package:nit_quiz/modules/quiz/quiz_finished/quiz_finished.dart';
import 'package:nit_quiz/modules/quiz/quiz_in_progress/cubit/cubit.dart';
import 'package:nit_quiz/modules/quiz/quiz_in_progress/cubit/states.dart';
import 'package:nit_quiz/shared/components/components.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';

class QuizScreenProgress extends StatelessWidget {
  QuizScreenProgress({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  final Quiz quiz;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    QuizProgressCubit cubit = QuizProgressCubit.get(context);
    Question question = quiz.question![cubit.i];
    return BlocConsumer<QuizProgressCubit, QuizProgressStates>(
        listener: (context, state) {
      if (state is NextStateQuizState) {
        question = quiz.question![cubit.i];
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: MyColors.defaultColor,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('  Question ${cubit.i+1}/5',
                    style: TextStyle(fontSize:18,color: MyColors.black),),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        question.text!,
                        style: TextStyle(
                            fontSize: 15, color: MyColors.defaultColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      child: Center(
                        child: ListView.builder(
                          itemCount: question.choices!.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(
                            title: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Center(
                                child: Text(
                                  question.choices![index].text!,
                                  style: TextStyle(
                                      color:
                                          question.choices![index].isSelected ??
                                                  false
                                              ? MyColors.white
                                              : MyColors.defaultColor),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: MyColors.defaultColor),
                                borderRadius: BorderRadius.circular(25),
                                color:
                                    question.choices![index].isSelected ?? false
                                        ? MyColors.defaultColor
                                        : Colors.transparent,
                              ),
                            ),
                            onTap: () {
                              cubit.isSelected(question.choices!, index);
                              if (question.choices![index].correct! == true) {
                                score++;
                              }
                            },
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        // border: Border.all(color: MyColors.defaultColor),
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defaultButton(
                      color: MyColors.defaultColor,
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      onPressed: () {
                        if (cubit.i < 4) {
                          cubit.index(cubit.i);
                        } else {
                          navigateAndFinish(context, QuizFinished(score: score));

                        }
                      },
                      text: cubit.i < 4 ? 'Next' : 'Submit',
                    ),
                  ),
                ),
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
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
