import 'package:e_commerce_app_c11/domain/entities/delete_item_in_favourite_response_entity.dart';

class DeleteItemInFavouriteResponseDto
    extends DeleteItemInFavouriteResponseEntity {
  DeleteItemInFavouriteResponseDto({
    super.status,
    super.message,
    super.data,
  });

  DeleteItemInFavouriteResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? statusMsg;
}
