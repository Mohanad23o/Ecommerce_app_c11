import 'package:e_commerce_app_c11/domain/entities/category_response_entity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
    this.results,
    this.metadata,
    this.data,
  });

  num? results;
  MetadataEntity? metadata;
  List<ProductEntity>? data;
}

class ProductEntity {
  ProductEntity({
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
  });

  num? sold;
  List<String>? images;
  List<SubCategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  Category? category;
  BrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;
}

class BrandEntity {
  BrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class SubCategoryEntity {
  SubCategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}
