import 'package:flutter/material.dart';
import 'package:product_api_app/model/product_model_details.dart';
import 'package:product_api_app/view/product_detail_screen.dart';
import 'package:product_api_app/widget/custom_text_widget.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.productList,
  });

  final List<ProductModelDetails> productList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: 0.65,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return GridTile(
            child: Card(
              //const Color(0xFFFF6407),
              color: const Color(0xFFF5F5F5),
              elevation: 2.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color(0xFFF5F5F5),
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  CustomTextWidget(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    text: product.title,
                  ),
                  Row(
                    children: [
                      CustomTextWidget(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        text: '\$${product.price.toString()}',
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        child: IconButton.outlined(
                            color: const Color(0xFFFF6407),
                            iconSize: 20,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ProductDetailScreen(
                                        product: product,
                                      )),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart)),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
