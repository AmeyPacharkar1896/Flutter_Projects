abstract class ProductEvent {
  const ProductEvent();
}

class ProductEventGetProductDetail extends ProductEvent {}

class ProductEventSelectTag extends ProductEvent {
  ProductEventSelectTag(this.tags, this.tag, this.isSelected);

  final List<String> tags;
  final String tag;
  final bool isSelected;
}
