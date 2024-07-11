import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_bloc.dart';
import 'package:product_api_app/view/product_screen.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductBloc(),
      child: ProductScreen(),
    );
  }
}
