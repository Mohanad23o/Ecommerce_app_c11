import 'package:e_commerce_app_c11/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;

  RegisterSuccessStates({required this.registerResponseEntity});
}

class RegisterErrorStates extends RegisterStates {
  Failures failures;

  RegisterErrorStates({required this.failures});
}
