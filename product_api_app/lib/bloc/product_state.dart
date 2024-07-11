import 'package:product_api_app/model/product_model_details.dart';

abstract class ProductState {
  ProductState();
}

class ProductStateInitial extends ProductState {
  ProductStateInitial();
}

class ProductStateLoading extends ProductState {}

class ProductStateLoaded extends ProductState {
  ProductStateLoaded({
    required this.productModelDetail,
    required this.selectedTags,
    required this.isSelectedColor,
  });

  final List<ProductModelDetails> productModelDetail;
  final List<String> selectedTags;
  final bool isSelectedColor;
}

class ProductStateError extends ProductState {
  final String message;

  ProductStateError({required this.message});
}
