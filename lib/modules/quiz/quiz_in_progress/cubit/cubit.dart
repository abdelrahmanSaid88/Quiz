import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/answer_model.dart';
import 'package:nit_quiz/model/models.dart';
import 'package:nit_quiz/modules/quiz/quiz_in_progress/cubit/states.dart';

class QuizProgressCubit extends Cubit<QuizProgressStates> {
  QuizProgressCubit() : super(QuizInitialProgressState());

  static QuizProgressCubit get(context) => BlocProvider.of(context);

void isSelected(List<Answer> choices, int i){
choices.forEach((element) {
  element.isSelected =false;
});
choices[i].isSelected=true;
  emit(SelectedStateQuizState());
}


  int i = 0;
  void index(int index) {
    index++;
     i = index;
    emit(NextStateQuizState(i));
  }
}
