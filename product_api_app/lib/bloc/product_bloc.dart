import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_event.dart';
import 'package:product_api_app/bloc/product_state.dart';
import 'package:product_api_app/model/product_model_details.dart';
import 'package:product_api_app/service/product_api_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductModelDetails> _allProduct = [];
  final List<String> _selectedTags = []; // Track selected tags

  ProductApiService productApiService = ProductApiService();

  ProductBloc() : super(ProductStateInitial()) {
    on<ProductEventGetProductDetail>(_onProductEventGetProductDetail);
    on<ProductEventSelectTag>(_onProductEventSelectTag);
  }

  Future<void> _onProductEventGetProductDetail(
    ProductEventGetProductDetail event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductStateLoading());
    try {
      final response = await productApiService.getAllProducts();
      if (response != null) {
        _allProduct = response.products;
        emit(ProductStateLoaded(
          productModelDetail: _allProduct,
          selectedTags: _selectedTags,
          isSelectedColor: true,
        ));
      } else {
        emit(ProductStateError(message: 'No products found'));
      }
    } catch (e) {
      emit(ProductStateError(message: e.toString()));
    }
  }

  void _onProductEventSelectTag(
    ProductEventSelectTag event,
    Emitter<ProductState> emit,
  ) {
    if (event.isSelected) {
      _selectedTags.add(event.tag);
    } else {
      _selectedTags.remove(event.tag);
    }

    if (_selectedTags.isEmpty) {
      emit(ProductStateLoaded(
        productModelDetail: _allProduct,
        selectedTags: _selectedTags,
        isSelectedColor: false,
      ));
    } else {
      final filteredProducts = _allProduct.where((product) {
        return _selectedTags.every((tag) => product.tags.contains(tag));
      }).toList();
      emit(ProductStateLoaded(
        productModelDetail: filteredProducts,
        selectedTags: _selectedTags,
        isSelectedColor: true,
      ));
    }
  }
}
