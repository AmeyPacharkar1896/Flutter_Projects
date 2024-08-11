import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/products/bloc/product_bloc.dart';
import 'package:jkb_firebase_chat/products/model/product_model_details.dart';
import 'package:jkb_firebase_chat/products/view/product_detail_screen/product_detail_screen.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.product,
  });

  final ProductModelDetails product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductBloc(),
      child: ProductDetailScreen(
        product: product,
      ),
    );
  }
}
