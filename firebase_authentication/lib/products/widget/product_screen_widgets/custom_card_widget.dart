import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/products/model/product_model_details.dart';
import 'package:jkb_firebase_chat/products/view/product_detail_screen/product_detail_page.dart';
import 'package:jkb_firebase_chat/products/widget/product_screen_widgets/custom_text_widget.dart';

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
                                  builder: ((context) => ProductDetailPage(
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
