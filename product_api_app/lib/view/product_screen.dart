import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_bloc.dart';
import 'package:product_api_app/bloc/product_event.dart';
import 'package:product_api_app/bloc/product_state.dart';
import 'package:product_api_app/widget/custom_card_widget.dart';
import 'package:product_api_app/widget/custom_filter_chip_widget.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<String> tagsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductStateInitial) {
            context.read<ProductBloc>().add(ProductEventGetProductDetail());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductStateLoaded) {
            final productList = state.productModelDetail;

            if (tagsList.isEmpty) {
              for (var product in productList) {
                for (var tag in product.tags) {
                  if (!tagsList.contains(tag)) {
                    tagsList.add(tag);
                  }
                }
              }
            }

            return Column(
              children: [
                SizedBox(
                  child: SearchAnchor(
                    builder:
                        (BuildContext context, SearchController controller) {
                      return SearchBar(
                        controller: controller,
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (value) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {},
                        );
                      });
                    },
                  ),
                ),
                CustomFilterChipWidget(state: state, tagsList: tagsList),
                CustomCardWidget(productList: productList)
              ],
            );
          } else if (state is ProductStateError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}

