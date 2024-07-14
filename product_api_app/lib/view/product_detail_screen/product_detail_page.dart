import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_bloc.dart';
import 'package:product_api_app/model/product_model_details.dart';
import 'package:product_api_app/view/product_detail_screen/product_detail_screen.dart';

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
