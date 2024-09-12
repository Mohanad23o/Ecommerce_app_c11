import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository}); // constructor injection

  Future<Either<Failures, LoginResponseEntity>> invoke({
    required String email,
    required String password,
  }) {
    return authRepository.login(
      email: email,
      password: password,
    );
  }
}
