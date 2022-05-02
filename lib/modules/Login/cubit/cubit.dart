import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nit_quiz/modules/Login/cubit/states.dart';
import 'package:nit_quiz/shared/components/constants.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  void shownSuffix() {
    isPassword = !isPassword;
    emit(ShownSuffixState());
  }

  void userLogin({
    @required String? email,
    @required String? password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }


  void googleSign()async{
    emit(GoogleLoadingState());
    await signInWithGoogle().then((value){
      uId = value.credential!.token as String?;
      emit(GoogleSuccessState(value.user!.uid));
    }
    ).onError((error, stackTrace){
      print(error.toString());
      emit(GoogleErrorState(error.toString()));
    });
  }
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  void facebookSign()async{
    emit(FacebookLoadingState());

    await signInWithFacebook().then((value){

      emit(FacebookSuccessState(value.credential!.providerId));
    }
    ).onError((error, stackTrace){
      print(error.toString());
      emit(FacebookErrorState(error.toString()));
    });
  }
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

}

