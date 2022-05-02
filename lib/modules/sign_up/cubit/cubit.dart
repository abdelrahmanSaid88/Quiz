import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nit_quiz/model/user_model.dart';
import 'package:nit_quiz/modules/sign_up/cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isHiddenPassword = true;

  void togglePasswordView() {
    isPassword = !isPassword;
    emit(ToggleState());
  }

  void toggleConfirmPasswordView() {
    isHiddenPassword = !isHiddenPassword;
    emit(ToggleConfirmState());
  }

  void userRegister({
    @required String? name,
    @required String? email,
    @required String? password,
    @required String? confirmPassword,
    @required String? phone,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      userCreate(
        uId: value.user!.uid,
        email: value.user!.email,
         name:  name,
        phone: phone,
      );

    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String? name,
    @required String? email,
    @required String? phone,
    @required String? uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      // isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
