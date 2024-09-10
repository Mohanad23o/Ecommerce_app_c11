import 'package:e_commerce_app_c11/data/model/product_response_dto.dart';
import 'package:e_commerce_app_c11/domain/entities/delete_cart_response_entity.dart';

class DeleteCartResponseDto extends DeleteCartResponseEntity {
  DeleteCartResponseDto({
    super.status,
    this.message,
    this.statusMsg,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  DeleteCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data =
        json['data'] != null ? DeleteCartDataDto.fromJson(json['data']) : null;
  }

  String? message;
  String? statusMsg;
}

class DeleteCartDataDto extends DeleteCartDataEntity {
  DeleteCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DeleteCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(DeleteCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class DeleteCartProductsDto extends DeleteCartProductsEntity {
  DeleteCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  DeleteCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDto.fromJson(json['product']) : null;
    price = json['price'];
  }
}
