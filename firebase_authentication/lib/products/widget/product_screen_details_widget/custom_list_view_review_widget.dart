import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/products/model/product_model_details.dart';

class CustomListViewReviewWidget extends StatelessWidget {
  const CustomListViewReviewWidget({
    super.key,
    required this.product,
  });

  final ProductModelDetails product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: product.reviews.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        final review = product.reviews[index];
        return ListTile(
          leading: const Icon(Icons.person),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.reviewerName,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                review.reviewerEmail,
                style: const TextStyle(fontSize: 10.0),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.comment,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.thumb_up_alt),
                  Text(
                    review.rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
