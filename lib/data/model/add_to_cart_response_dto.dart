import 'package:e_commerce_app_c11/domain/entities/add_to_cart_response_entity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddToCartDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class AddToCartDto extends AddToCartEntity {
  AddToCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddToCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddToCartProductsDto extends AddToCartProductsEntity {
  AddToCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddToCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
