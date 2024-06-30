import 'package:flutter/material.dart';
import 'package:user_data_api/model/recipe_model_data.dart';
import 'package:user_data_api/view/recipe_instruction_or_ingredients_screen.dart';
import 'package:user_data_api/widget/dish_details_text_widget.dart';
import 'package:user_data_api/widget/text_widget.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModelData recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Recipe Details',
          fontSizeText: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(recipe.image),
            TextWidget(
              text: recipe.name,
              fontWeight: FontWeight.bold,
              fontSizeText: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                  text: recipe.mealType.toString(),
                  fontSizeText: 15,
                ),
                TextWidget(
                  text: recipe.difficulty,
                  fontSizeText: 15,
                ),
                TextWidget(
                  text: recipe.cuisine,
                  fontSizeText: 15,
                ),
              ],
            ),
            DishDetailsTextWidget(recipe: recipe),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFFB8A22)), //FB8A22
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeInstructionOrIngrediantsList(
                            recipe: recipe,
                            isInstruction: false,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Ingrediants',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xFFFB8A22),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeInstructionOrIngrediantsList(
                            recipe: recipe,
                            isInstruction: true,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Instrutions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
