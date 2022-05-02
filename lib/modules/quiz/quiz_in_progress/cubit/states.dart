import 'package:nit_quiz/model/models.dart';

abstract class QuizProgressStates{

}
class QuizInitialProgressState extends QuizProgressStates{

}
class NextStateQuizState extends QuizProgressStates{
int?i;

NextStateQuizState(this.i);
}
class SelectedStateQuizState extends QuizProgressStates{

}

