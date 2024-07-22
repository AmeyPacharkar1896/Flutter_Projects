import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_event.dart';
import 'package:product_api_app/bloc/product_state.dart';
import 'package:product_api_app/model/product_model_details.dart';
import 'package:product_api_app/service/product_api_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<ProductModelDetails> _allProducts = [];
  final List<String> _selectedTags = [];
  ProductApiService productApiService = ProductApiService();

  ProductBloc() : super(ProductStateInitial()) {
    on<ProductEventGetProductDetail>(_onGetProductDetail);
    on<ProductEventSelectTag>(_onSelectTag);
    on<ProductEventSelectSegment>(_onSelectSegment);
    on<ProductEventChangeState>(_onChangeState);
    on<ProductEventSearch>(_onSearch);
  }

  Future<void> _onGetProductDetail(
      ProductEventGetProductDetail event, Emitter<ProductState> emit) async {
    emit(ProductStateLoading());
    try {
      final response = await productApiService.getAllProducts();
      if (response != null) {
        _allProducts = response.products;
        emit(ProductStateLoaded(
          productModelDetail: _allProducts,
          selectedTags: _selectedTags,
          isSelectedColor: true,
          selectedSegment: 0,
          searchResults: _allProducts,
        ));
      } else {
        emit(ProductStateError(message: 'No products found'));
      }
    } catch (e) {
      emit(ProductStateError(message: e.toString()));
    }
  }

  void _onSelectTag(ProductEventSelectTag event, Emitter<ProductState> emit) {
    if (event.isSelected) {
      _selectedTags.add(event.tag);
    } else {
      _selectedTags.remove(event.tag);
    }

    if (_selectedTags.isEmpty) {
      emit(ProductStateLoaded(
        productModelDetail: _allProducts,
        selectedTags: _selectedTags,
        isSelectedColor: false,
        selectedSegment: (state as ProductStateLoaded).selectedSegment,
        searchResults: _allProducts,
      ));
    } else {
      final filteredProducts = _allProducts.where((product) {
        return _selectedTags.every((tag) => product.tags.contains(tag));
      }).toList();
      emit(ProductStateLoaded(
        productModelDetail: filteredProducts,
        selectedTags: _selectedTags,
        isSelectedColor: true,
        selectedSegment: (state as ProductStateLoaded).selectedSegment,
        searchResults: filteredProducts,
      ));
    }
  }

  void _onSelectSegment(
      ProductEventSelectSegment event, Emitter<ProductState> emit) {
    if (state is ProductStateLoaded) {
      emit(
        ProductStateLoaded(
          productModelDetail: (state as ProductStateLoaded).productModelDetail,
          selectedTags: (state as ProductStateLoaded).selectedTags,
          isSelectedColor: (state as ProductStateLoaded).isSelectedColor,
          selectedSegment: event.selectedIndex,
          searchResults: (state as ProductStateLoaded).searchResults,
        ),
      );
    }
  }

  void _onChangeState(
      ProductEventChangeState event, Emitter<ProductState> emit) {
    if (state is ProductStateInitial) {
      emit(
        ProductStateLoaded(
          productModelDetail: _allProducts,
          selectedTags: _selectedTags,
          isSelectedColor: true,
          selectedSegment: 0,
          searchResults: _allProducts,
        ),
      );
    }
  }

  void _onSearch(ProductEventSearch event, Emitter<ProductState> emit) {
    if (state is ProductStateLoaded) {
      final loadedState = state as ProductStateLoaded;
      final searchResults = _allProducts
          .where((product) =>
              product.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(ProductStateLoaded(
        productModelDetail: loadedState.productModelDetail,
        selectedTags: loadedState.selectedTags,
        isSelectedColor: loadedState.isSelectedColor,
        selectedSegment: loadedState.selectedSegment,
        searchResults: searchResults,
      ));
    }
  }
}
