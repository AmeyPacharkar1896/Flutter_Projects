import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/products/model/product_model_details.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.product,
  });

  final ProductModelDetails product;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.images.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Center(
          child: Image.network(
            product.images[index],
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      },
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}
