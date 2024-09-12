import 'package:e_commerce_app_c11/domain/entities/login_response_entity.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginState {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
