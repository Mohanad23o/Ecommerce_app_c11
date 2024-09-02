import 'package:e_commerce_app_c11/data/model/register_response_Dto.dart';
import 'package:e_commerce_app_c11/domain/entities/login_response_entity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.user,
    super.statusMsg,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}
