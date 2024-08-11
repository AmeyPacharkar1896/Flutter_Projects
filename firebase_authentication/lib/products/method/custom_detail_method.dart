import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/products/model/product_model_details.dart';

Column customDetailMethod(ProductModelDetails product) {
  return Column(
    children: [
      Text("Brand : ${product.brand.toString()}"),
      Text("The product has an warrenty of ${product.warrantyInformation}"),
      Text("The product will be shipped in ${product.shippingInformation}"),
      Text(
          "The product can be returned in the time span of ${product.returnPolicy}"),
      Text("Minimum ordered value must be ${product.minimumOrderQuantity}"),
    ],
  );
}
