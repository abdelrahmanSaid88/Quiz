abstract class SignUpStates{

}
class SignUpInitialState extends SignUpStates{

}
class ToggleState extends SignUpStates{

}
class ToggleConfirmState extends SignUpStates{

}

class RegisterLoadingState extends SignUpInitialState {}

class RegisterSuccessState extends SignUpInitialState {}

class RegisterErrorState extends SignUpInitialState
{
  final String error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends SignUpInitialState {}

class CreateUserErrorState extends SignUpInitialState
{
  final String error;

  CreateUserErrorState(this.error);
}

