import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/recipe_bloc.dart';
import 'package:user_data_api/view/recipe_screen.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RecipeBloc(),
      child: RecipeScreen(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return RecipeScreen();
  // }
}