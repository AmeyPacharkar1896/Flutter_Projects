
import 'package:http/http.dart';
import 'package:user_data_api/model/recipe_model.dart';

class RecipeService {
  final Client client = Client();

  Future<RecipeModel?> getAllRecipes() async {
    // try {
      final uri = Uri.parse("https://dummyjson.com/recipes");
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        return RecipeModel.fromJson(response.body);
      } 
      return null;
    // } catch (e) {
    //   log(e.toString());
    //   return null;
    // }
  }
}
