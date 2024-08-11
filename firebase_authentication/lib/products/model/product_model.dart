import 'dart:convert';

import 'package:jkb_firebase_chat/products/model/product_model_details.dart';

class ProductModel {
  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(String jsonString) {
    return ProductModel.fromMap(
        json.decode(jsonString) as Map<String, dynamic>);
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      products: (map['products'] as List)
          .map((productMap) =>
              ProductModelDetails.fromMap(productMap as Map<String, dynamic>))
          .toList(),
      total: map['total'] as int,
      skip: map['skip'] as int,
      limit: map['limit'] as int,
    );
  }

  final List<ProductModelDetails> products;
  final int total;
  final int skip;
  final int limit;
}
