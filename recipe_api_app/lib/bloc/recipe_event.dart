abstract class RecipeEvent {}

class RecipeEventGetRecipeDetails extends RecipeEvent {}

class RecipeEventFilterByCuisine extends RecipeEvent {
  final String cuisine;

  RecipeEventFilterByCuisine(this.cuisine);
}
