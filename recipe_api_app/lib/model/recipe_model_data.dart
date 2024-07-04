class RecipeModelData {
  const RecipeModelData({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  // factory RecipeModelData.fromJson(String jsonString) {
  //   return RecipeModelData.fromMap(
  //     json.decode(jsonString) as Map<String, dynamic>,
  //   );
  // }

  factory RecipeModelData.fromMap(Map<String, dynamic> map) {
    return RecipeModelData(
      id: map['id'] as int,
      name: map['name'] as String,
      ingredients: (map['ingredients'] as List).map((e) => e.toString()).toList(),
      instructions: (map['instructions'] as List).map((e) => e.toString()).toList(),
      prepTimeMinutes: map['prepTimeMinutes'] as int,
      cookTimeMinutes: map['cookTimeMinutes'] as int,
      servings: map['servings'] as int,
      difficulty: map['difficulty'] as String,
      cuisine: map['cuisine'] as String,
      caloriesPerServing: map['caloriesPerServing'] as int,
      tags: (map['tags'] as List).map((e) => e.toString()).toList(),
      userId: map['userId'] as int,
      image: map['image'] as String,
      rating: map['rating'].toDouble(),
      reviewCount: map['reviewCount'] as int,
      mealType: (map['mealType'] as List).map((e) => e.toString()).toList(),
    );
  }

  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;
}
