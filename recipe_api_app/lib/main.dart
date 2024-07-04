import 'package:flutter/material.dart';
import 'package:user_data_api/service/recipe_service.dart';
import 'package:user_data_api/view/recipe_page.dart';

void main() {
  RecipeService recipeApiService = RecipeService();
  recipeApiService.getAllRecipes();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecipePage(),
  ));
}