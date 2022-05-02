import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/modules/quiz/start_quiz/cubit/states.dart';

class StartQuizCubit extends Cubit<StartQuizStates> {
  StartQuizCubit() : super(StartQuizInitialState());

  static StartQuizCubit get(context) => BlocProvider.of(context);
}