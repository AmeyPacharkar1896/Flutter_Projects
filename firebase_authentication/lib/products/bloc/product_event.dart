part of 'product_bloc.dart';
abstract class ProductEvent {}

class ProductEventGetProductDetail extends ProductEvent {}

class ProductEventSelectTag extends ProductEvent {
  final List<String> tags;
  final String tag;
  final bool isSelected;

  ProductEventSelectTag(
    this.tags,
    this.tag,
    this.isSelected,
  );
}

class ProductEventSelectSegment extends ProductEvent {
  final int selectedIndex;

  ProductEventSelectSegment(this.selectedIndex);
}

class ProductEventChangeState extends ProductEvent {}

class ProductEventSearch extends ProductEvent {
  final String query;

  ProductEventSearch(this.query);
}
