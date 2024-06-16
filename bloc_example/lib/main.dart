import 'package:bloc_example/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/view/screen/counter_bloc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
    runApp(
      BlocProvider(
        create: (context) => CounterBloc(),
        child: const MaterialApp(
          home: CounterBlocScreen(),
        )
      )
    );
}