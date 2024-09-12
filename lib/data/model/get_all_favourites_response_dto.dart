import 'package:e_commerce_app_c11/data/model/product_response_dto.dart';
import 'package:e_commerce_app_c11/domain/entities/get_all_favourites_response_entity.dart';

class GetAllFavouritesResponseDto extends GetAllFavouritesResponseEntity {
  GetAllFavouritesResponseDto({
    super.status,
    super.count,
    super.data,
  });

  GetAllFavouritesResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetAllFavouritesResponseDataDto.fromJson(v));
      });
    }
  }

  String? message;
  String? statusMsg;
}

class GetAllFavouritesResponseDataDto
    extends GetAllFavouritesDataResponseEntity {
  GetAllFavouritesResponseDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  GetAllFavouritesResponseDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}
