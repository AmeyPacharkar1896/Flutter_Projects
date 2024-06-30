import 'dart:convert';

import 'package:user_data_api/model/recipe_model_data.dart';
// List recipeList 
class RecipeModel {
  const RecipeModel({
    required this.recipes,
  });

  factory RecipeModel.fromJson(String jsonString) {
    return RecipeModel.fromMap(
      json.decode(jsonString) as Map<String, dynamic>,
    );
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
        recipes: (map['recipes'] as List)
            .map((recipeMap) => RecipeModelData.fromMap(recipeMap as Map<String, dynamic>))
            .toList());
  }

  final List<RecipeModelData> recipes;
}