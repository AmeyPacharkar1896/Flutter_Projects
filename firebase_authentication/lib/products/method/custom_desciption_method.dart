import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/products/model/product_model_details.dart';

Column customDescriptionMethod(ProductModelDetails product) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(product.description),
      ],
    );
  }