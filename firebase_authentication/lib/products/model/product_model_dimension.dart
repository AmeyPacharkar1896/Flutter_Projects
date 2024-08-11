class ProductModelDimension {
  ProductModelDimension({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory ProductModelDimension.fromMap(Map<String, dynamic> map) {
    return ProductModelDimension(
      width: double.parse(map['width'].toString()),
      height: double.parse(map['height'].toString()),
      depth: double.parse(map['depth'].toString()),
    );
  }

  final double width;
  final double height;
  final double depth;
}
