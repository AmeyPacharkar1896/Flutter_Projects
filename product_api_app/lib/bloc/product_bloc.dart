import 'package:bloc/bloc.dart';
import 'package:product_api_app/bloc/product_event.dart';
import 'package:product_api_app/bloc/product_state.dart';
import 'package:product_api_app/model/product_model_details.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<ProductModelDetails> _allProducts = []; // Assuming you fetch and store all products here.

  ProductBloc() : super(ProductStateInitial()) {
    on<ProductEventGetProductDetail>(_onGetProductDetail);
    on<ProductEventSelectTag>(_onSelectTag);
    on<ProductEventSelectSegment>(_onSelectSegment);
    on<ProductEventChangeState>(_onChangeState);
    on<ProductEventSearch>(_onSearch); // Add event handler for search
  }

  void _onGetProductDetail(ProductEventGetProductDetail event, Emitter<ProductState> emit) {
    emit(ProductStateLoading());
    // Fetch products and emit ProductStateLoaded with fetched products.
    // For simplicity, assuming products are fetched and assigned to _allProducts
    emit(ProductStateLoaded(
      productModelDetail: _allProducts,
      selectedTags: [],
      isSelectedColor: false,
      selectedSegment: 0,
      searchResults: _allProducts,
    ));
  }

  void _onSelectTag(ProductEventSelectTag event, Emitter<ProductState> emit) {
    // Handle tag selection logic
  }

  void _onSelectSegment(ProductEventSelectSegment event, Emitter<ProductState> emit) {
    // Handle segment selection logic
  }

  void _onChangeState(ProductEventChangeState event, Emitter<ProductState> emit) {
    // Handle state change logic
  }

  void _onSearch(ProductEventSearch event, Emitter<ProductState> emit) {
    if (state is ProductStateLoaded) {
      final loadedState = state as ProductStateLoaded;
      final searchResults = _allProducts
          .where((product) => product.title.toLowerCase().contains(event.query.toLowerCase()))
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
