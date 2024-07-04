class ProductModelDimension {
  ProductModelDimension({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory ProductModelDimension.fromMap(Map<String, dynamic> map) {
    return ProductModelDimension(
      width: map['width']as double, 
      height: map['height'] as double, 
      depth: map['depth'] as double,
      );
  }

  final double width;
  final double height;
  final double depth;
}
