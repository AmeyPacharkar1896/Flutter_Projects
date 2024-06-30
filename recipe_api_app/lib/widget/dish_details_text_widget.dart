import 'package:flutter/cupertino.dart';
import 'package:user_data_api/model/recipe_model_data.dart';
import 'package:user_data_api/widget/text_widget.dart';

class DishDetailsTextWidget extends StatelessWidget {
  const DishDetailsTextWidget({
    super.key,
    required this.recipe,
  });

  final RecipeModelData recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text:
              'It takes ${recipe.prepTimeMinutes}minute to prepare and ${recipe.cookTimeMinutes}minute to cook',
          fontSizeText: 15,
        ),
        TextWidget(
          text:
              'It consists of ${recipe.caloriesPerServing} calories per serving',
          fontSizeText: 15,
        ),
        TextWidget(
          text: 'This dish can be served upto ${recipe.servings} servings',
          fontSizeText: 15,
        ),
      ],
    );
  }
}
