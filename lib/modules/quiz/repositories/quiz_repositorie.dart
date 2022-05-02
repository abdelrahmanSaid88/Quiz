import 'package:nit_quiz/model/models.dart';

class QuizRepositories{

  List<Quiz>getAllQuizzes(){
    return quizData;
  }
  Quiz getQuizById(String id){
   return quizData.firstWhere((quiz)=>quiz.id==id);
  }



}