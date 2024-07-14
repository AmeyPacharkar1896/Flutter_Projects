import 'package:product_api_app/model/product_model_details.dart';

abstract class ProductState {}

class ProductStateInitial extends ProductState {}

class ProductStateLoading extends ProductState {}

class ProductStateLoaded extends ProductState {
  final List<ProductModelDetails> productModelDetail;
  final List<String> selectedTags;
  final bool isSelectedColor;
  final int selectedSegment;
  final List<ProductModelDetails>? searchResults; // Optional search results

  ProductStateLoaded({
    required this.productModelDetail,
    required this.selectedTags,
    required this.isSelectedColor,
    required this.selectedSegment,
    this.searchResults,
  });
}

class ProductStateError extends ProductState {
  final String message;

  ProductStateError({required this.message});
}
