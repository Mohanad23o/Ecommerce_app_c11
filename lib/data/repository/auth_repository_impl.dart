import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app_c11/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app_c11/domain/error.dart';
import 'package:e_commerce_app_c11/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String rePassword}) async {
    var either = await authRemoteDataSource.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        rePassword: rePassword);
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      {required String email, required String password}) async {
    var either = await authRemoteDataSource.login(
      email: email,
      password: password,
    );
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }
}
