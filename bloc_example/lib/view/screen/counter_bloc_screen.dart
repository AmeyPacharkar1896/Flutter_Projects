
import 'package:bloc_example/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/counter_bloc/counter_state.dart';
import 'package:bloc_example/view/widget/decrement_counter.dart';
import 'package:bloc_example/view/widget/increment_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Counter Bloc Screen',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(
                  fontSize: 50,
                ),  
              );
          },),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          DecrementCounter(),
          IncrementCounter(),
            ],
          )
        ],
      ),
    );
  }
}