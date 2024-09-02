import 'package:e_commerce_app_c11/domain/entities/register_response_entity.dart';

class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
}
