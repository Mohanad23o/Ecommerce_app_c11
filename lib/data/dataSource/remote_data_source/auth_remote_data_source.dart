import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String rePassword});

  Future<Either<Failures, LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}
