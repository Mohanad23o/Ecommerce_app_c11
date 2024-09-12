import 'package:e_commerce_app_c11/domain/useCases/register_use_case.dart';
import 'package:e_commerce_app_c11/features/auth/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterLoadingState());
  var nameController = TextEditingController(text: 'mohanad');
  var phoneNumController = TextEditingController(text: '01202911648');
  var emailController = TextEditingController(text: 'moh2n2dayman@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  var rePasswordController = TextEditingController(text: '123456');

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        name: nameController.text,
        email: emailController.text,
        phone: phoneNumController.text,
        password: passwordController.text,
        rePassword: rePasswordController.text);
    either.fold((l) {
      emit(RegisterErrorStates(failures: l));
    }, (r) {
      emit(RegisterSuccessStates(registerResponseEntity: r));
    });
  }
}
