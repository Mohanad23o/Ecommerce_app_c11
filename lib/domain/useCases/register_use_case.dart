import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository}); // constructor injection

  Future<Either<Failures, RegisterResponseEntity>> invoke(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String rePassword}) {
    return authRepository.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        rePassword: rePassword);
  }
}
