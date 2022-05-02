import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/modules/Login/login_screen.dart';
import 'package:nit_quiz/modules/home/cubit/states.dart';
import 'package:nit_quiz/shared/components/components.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


}
