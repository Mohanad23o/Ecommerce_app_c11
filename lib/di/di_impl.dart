import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app_c11/data/dataSource/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:e_commerce_app_c11/data/repository/auth_repository_impl.dart';
import 'package:e_commerce_app_c11/domain/repository/auth_repository.dart';
import 'package:e_commerce_app_c11/domain/useCases/login_use_case.dart';
import 'package:e_commerce_app_c11/domain/useCases/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl();
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepository: injectAuthRepository());
}
