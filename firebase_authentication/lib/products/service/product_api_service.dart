import 'package:http/http.dart';
import 'package:jkb_firebase_chat/products/model/product_model.dart';

class ProductApiService {
  final Client client = Client();
  final String uriLink = 'https://dummyjson.com/products';

  Future<ProductModel?> getAllProducts() async {
    final uri = Uri.parse(uriLink);
    final response = await client.get(uri);

    if(response.statusCode == 200) {
      return ProductModel.fromJson(response.body);
    }
      return null;
  }
}