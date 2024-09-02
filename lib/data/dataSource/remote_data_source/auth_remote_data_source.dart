import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/data/model/login_response_dto.dart';
import 'package:e_commerce_app_c11/data/model/register_response_dto.dart';
import 'package:e_commerce_app_c11/domain/error.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseDto>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String rePassword});

  Future<Either<Failures, LoginResponseDto>> login({
    required String email,
    required String password,
  });
}
