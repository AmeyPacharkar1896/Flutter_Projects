import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/products/bloc/product_bloc.dart';
import 'package:jkb_firebase_chat/products/widget/product_screen_widgets/custom_card_widget.dart';
import 'package:jkb_firebase_chat/products/widget/product_screen_widgets/custom_filter_chip_widget.dart';

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
            final searchResults = state.searchResults;

            if (tagsList.isEmpty) {
              for (var product in productList) {
                for (var tag in product.tags) {
                  if (!tagsList.contains(tag)) {
                    tagsList.add(tag);
                  }
                }
              }
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Column(
                children: [
                  SizedBox(
                    child: SearchAnchor(
                      builder: (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (value) {
                            context.read<ProductBloc>().add(ProductEventSearch(controller.text));
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                        );
                      },
                      suggestionsBuilder: (BuildContext context, SearchController controller) {
                        if (searchResults == null || searchResults.isEmpty) {
                          return [const ListTile(title: Text('No results found'))];
                        }

                        return List<ListTile>.generate(searchResults.length, (int index) {
                          final String item = searchResults[index].title;
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              controller.text = item;
                              context.read<ProductBloc>().add(ProductEventSearch(item));
                            },
                          );
                        });
                      },
                    ),
                  ),
                  CustomFilterChipWidget(state: state, tagsList: tagsList),
                  CustomCardWidget(productList: productList)
                ],
              ),
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
