import 'package:e_commerce_app_c11/domain/entities/add_to_favourite_response_entity.dart';

class AddToFavouriteDto extends AddToFavouriteResponseEntity {
  AddToFavouriteDto({
    super.status,
    super.message,
    super.data,
  });

  AddToFavouriteDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? statusMsg;
}
