
import 'package:jkb_firebase_chat/products/model/product_model_dimension.dart';
import 'package:jkb_firebase_chat/products/model/product_model_review.dart';

class ProductModelDetails {
  ProductModelDetails({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModelDetails.fromMap(Map<String, dynamic> map) {
    return ProductModelDetails(
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
      discountPercentage: double.parse(map['discountPercentage'].toString()),
      rating: map['rating'] as double,
      stock: map['stock'] as int,
      tags: List<String>.from(map['tags']),
      brand: map['brand'] as String?,
      weight: map['weight'] as int,
      dimensions: ProductModelDimension.fromMap(map['dimensions'] as Map<String, dynamic>),
      warrantyInformation: map['warrantyInformation'] as String,
      shippingInformation: map['shippingInformation'] as String,
      availabilityStatus: map['availabilityStatus'] as String,
      reviews: (map['reviews'] as List)
          .map((reviewMap) => ProductModelReviews.fromMap(reviewMap as Map<String, dynamic>))
          .toList(),
      returnPolicy: map['returnPolicy'] as String,
      minimumOrderQuantity: map['minimumOrderQuantity'] as int,
      meta: Map<String, String>.from(map['meta'] as Map),
      images: List<String>.from(map['images']), 
      thumbnail: map['thumbnail'] as String,
    );
  }

  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand;
  final int weight;
  final ProductModelDimension dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ProductModelReviews> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Map<String, String> meta;
   final List<String> images;
  final String thumbnail;
}
