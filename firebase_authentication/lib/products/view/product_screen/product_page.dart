import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/products/bloc/product_bloc.dart';
import 'package:jkb_firebase_chat/products/view/product_screen/product_screen.dart';

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
