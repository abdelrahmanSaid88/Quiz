import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/answer_model.dart';
import 'package:nit_quiz/model/models.dart';
import 'package:nit_quiz/modules/Login/login_screen.dart';
import 'package:nit_quiz/modules/quiz/quiz_finished/cubit/states.dart';
import 'package:nit_quiz/shared/components/components.dart';
import 'package:nit_quiz/shared/components/constants.dart';
import 'package:nit_quiz/shared/local/cache_helper.dart';

class QuizFinishedCubit extends Cubit<QuizFinishedStates> {
  QuizFinishedCubit() : super(QuizFinishedInitialState());

  static QuizFinishedCubit get(context) => BlocProvider.of(context);

  void clearAnswer(List<Quiz> quizData){
    quizData.forEach((quiz) {
      quiz.question!.forEach((question) {
        question.choices!.forEach((answer) {
          answer.isSelected=false;
        });
      });
    });
    emit(ClearStateQuizState());
  }
  Future<void> logOutClick(context) async {
    await FirebaseAuth.instance.signOut();
    CacheHelper.removeData(key: 'uId').then((value){
      navigateAndFinish(context, LoginScreen());
      emit(LogOutState());
    });
  }
}