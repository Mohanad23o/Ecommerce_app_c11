import 'package:e_commerce_app_c11/data/model/product_response_dto.dart';
import 'package:e_commerce_app_c11/domain/entities/get_cart_response_entity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetCartDataDto.fromJson(json['data']) : null;
  }

  String? message;
  String? statusMsg;
}

class GetCartDataDto extends GetCartDataEntity {
  GetCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetCartProductsDto extends GetCartProductsEntity {
  GetCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDto.fromJson(json['product']) : null;
    price = json['price'];
  }
}
