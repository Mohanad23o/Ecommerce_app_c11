import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';
import 'package:e_commerce_app_c11/domain/entities/product_response_entity.dart';

class GetAllFavouritesResponseEntity {
  GetAllFavouritesResponseEntity({
    this.status,
    this.count,
    this.data,
  });

  String? status;
  num? count;
  List<GetAllFavouritesDataResponseEntity>? data;
}

class GetAllFavouritesDataResponseEntity {
  GetAllFavouritesDataResponseEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  num? sold;
  List<String>? images;
  List<SubCategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;
}
