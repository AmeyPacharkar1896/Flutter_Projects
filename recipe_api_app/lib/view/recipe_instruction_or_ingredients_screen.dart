import 'package:flutter/material.dart';
import 'package:user_data_api/model/recipe_model_data.dart';
import 'package:user_data_api/widget/app_bar_text_widget.dart';
import 'package:user_data_api/widget/text_widget.dart';

class RecipeInstructionOrIngrediantsList extends StatefulWidget {
  const RecipeInstructionOrIngrediantsList({
    super.key,
    required this.recipe,
    required this.isInstruction,
  });

  final RecipeModelData recipe;
  final bool isInstruction;

  @override
  State<RecipeInstructionOrIngrediantsList> createState() =>
      _RecipeInstructionListState();
}

class _RecipeInstructionListState
    extends State<RecipeInstructionOrIngrediantsList> {
  @override
  void initState() {
    super.initState();
    recipe = widget.recipe;
    isInstruction = widget.isInstruction;
    isChecked = List.filled(
        isInstruction ? recipe.instructions.length : recipe.ingredients.length,
        false);
  }

  late RecipeModelData recipe;
  late bool isInstruction;
  late List<bool?> isChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTextWidget(
          text: isInstruction ? 'Instructions' : 'Ingrediants',
        ),
        backgroundColor: const Color(0xFFFB8A22),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: isInstruction
            ? recipe.instructions.length
            : recipe.ingredients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: TextWidget(
              text: (index + 1).toString(),
              fontSizeText: 15,
            ),
            title: TextWidget(
              text: isInstruction
                  ? recipe.instructions[index].toString()
                  : recipe.ingredients[index].toString(),
              fontSizeText: 20,
            ),
            trailing: Checkbox(
              value: isChecked[index],
              onChanged: (bool? value) {
                setState(() {
                  isChecked[index] = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
