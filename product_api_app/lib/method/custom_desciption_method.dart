import 'package:flutter/material.dart';
import 'package:product_api_app/model/product_model_details.dart';

Column customDescriptionMethod(ProductModelDetails product) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(product.description),
      ],
    );
  }