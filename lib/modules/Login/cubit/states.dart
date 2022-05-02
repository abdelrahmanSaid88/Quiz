abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ShownSuffixState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoadingState extends LoginStates {}

class GoogleSuccessState extends LoginStates {
  final String uId;

  GoogleSuccessState(this.uId);
}

class GoogleLoadingState extends LoginStates {}


class GoogleErrorState extends LoginStates {
  final String error;

  GoogleErrorState(this.error);
}
class FacebookSuccessState extends LoginStates {
  final String uId;

  FacebookSuccessState(this.uId);
}

class FacebookLoadingState extends LoginStates {

}

class FacebookErrorState extends LoginStates {
  final String error;

  FacebookErrorState(this.error);
}

class LoginSuccessState extends LoginStates {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}
