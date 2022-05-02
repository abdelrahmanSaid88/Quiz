import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/models.dart';
import 'package:nit_quiz/modules/quiz/start_quiz/cubit/cubit.dart';
import 'package:nit_quiz/modules/quiz/start_quiz/cubit/states.dart';
import 'package:nit_quiz/shared/components/styles/colors.dart';

import '../quiz_in_progress/quiz_screen_progress.dart';

class StartQuizScreen extends StatelessWidget {
  int?i;
  StartQuizScreen({Key? key, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz quiz = quizData[i!];
    return BlocConsumer<StartQuizCubit, StartQuizStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: MyColors.defaultColor,
                    title: Center(child: Text(quiz.name!))),
                body: QuizScreenProgress(quiz:quiz)),
          );
        });
  }


}


