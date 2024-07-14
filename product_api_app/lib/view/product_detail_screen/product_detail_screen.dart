import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_bloc.dart';
import 'package:product_api_app/bloc/product_state.dart';
import 'package:product_api_app/method/custom_desciption_method.dart';
import 'package:product_api_app/method/custom_detail_method.dart';
import 'package:product_api_app/model/product_model_details.dart';
import 'package:product_api_app/widget/product_screen_details_widget/custom_carousel_slider.dart';
import 'package:product_api_app/widget/product_screen_details_widget/custom_list_view_review_widget.dart';
import 'package:product_api_app/widget/product_screen_details_widget/custom_toggle_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final ProductModelDetails product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCarouselSlider(product: product),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const CustomToggleButton(),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductStateLoaded) {
                        switch (state.selectedSegment) {
                          case 0:
                            return customDescriptionMethod(product);
                          case 1:
                            return customDetailMethod(product);
                          case 2:
                            return CustomListViewReviewWidget(product: product);
                          default:
                            return Container();
                        }
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
