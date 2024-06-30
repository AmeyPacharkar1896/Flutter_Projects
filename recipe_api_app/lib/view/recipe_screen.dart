import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/recipe_bloc.dart';
import 'package:user_data_api/bloc/recipe_event.dart';
import 'package:user_data_api/bloc/recipe_state.dart';
import 'package:user_data_api/view/recipe_detail_screen.dart';
import 'package:user_data_api/widget/text_widget.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeBloc>().add(RecipeEventGetRecipeDetails());
  }

  final List<String> cuisine = [];
  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Recipe App',
          fontWeight: FontWeight.w300,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: 'Let\'s Cook',
            fontWeight: FontWeight.w300,
          ),
          const TextWidget(
            text: 'Something Delicious',
            fontWeight: FontWeight.bold,
          ),
          BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              final recipeList = state.recipedetails;
              if (recipeList.isEmpty) {
                return const Center(
                  child: Text('No recipes available'),
                );
              }

              cuisine.clear();
              for (var recipe in recipeList) {
                if (!cuisine.contains(recipe.cuisine)) {
                  cuisine.add(recipe.cuisine);
                }
              }

              return Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                      child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cuisine.length,
                          itemBuilder: (context, index) {
                            final recipe = recipeList[index];
                            return SizedBox(
                              width: 94,
                              child: TextButton(
                                onPressed: () {
                                  isFiltered
                                      ? context
                                          .read<RecipeBloc>()
                                          .add(RecipeEventFilterByCuisine(
                                              cuisine[index]))
                                      : context
                                          .read<RecipeBloc>()
                                          .add(RecipeEventGetRecipeDetails());
                                  isFiltered ? isFiltered = false : isFiltered = true;
                                },
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        recipe.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(cuisine[index]),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: recipeList.length,
                        itemBuilder: (context, index) {
                          final recipe = recipeList[index];
                          return ListTile(
                            leading: ClipOval(
                              child: Image.network(
                                recipe.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(recipe.name),
                            subtitle: Text(recipe.difficulty.toString()),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipe: recipe),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
