import 'package:e_commerce_app_c11/domain/useCases/login_use_case.dart';
import 'package:e_commerce_app_c11/features/auth/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        email: emailController.text, password: passwordController.text);
    either.fold((l) {
      emit(LoginErrorState(errorMessage: l.errorMessage));
    }, (r) {
      emit(LoginSuccessState(loginResponseEntity: r));
    });
  }
}
