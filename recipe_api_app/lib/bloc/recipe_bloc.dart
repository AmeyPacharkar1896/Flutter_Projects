import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/recipe_event.dart';
import 'package:user_data_api/bloc/recipe_state.dart';
import 'package:user_data_api/model/recipe_model_data.dart';
import 'package:user_data_api/service/recipe_service.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  List<RecipeModelData> _allRecipes = []; 

  RecipeBloc() : super(RecipeState(recipedetails: [])) {
    on<RecipeEventGetRecipeDetails>(_onRecipeEventGetRecipeDetails);
    on<RecipeEventFilterByCuisine>(_onFilterByCuisine);
  }

  RecipeService recipeApiService = RecipeService();

  FutureOr<void> _onRecipeEventGetRecipeDetails(
    RecipeEventGetRecipeDetails event,
    Emitter<RecipeState> emit,
  ) async {
    final response = await recipeApiService.getAllRecipes();
    if (response != null) {
      _allRecipes = response.recipes; 
      emit(
        RecipeState(recipedetails: _allRecipes),
      );
    }
  }

  void _onFilterByCuisine(
    RecipeEventFilterByCuisine event,
    Emitter<RecipeState> emit,
  ) {
    final filteredRecipes =
        _allRecipes.where((recipe) => recipe.cuisine == event.cuisine).toList();
    emit(RecipeState(recipedetails: filteredRecipes));
  }
}
