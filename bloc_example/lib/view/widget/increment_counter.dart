import 'package:bloc_example/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/counter_bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementCounter extends StatelessWidget {
  const IncrementCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
        onPressed: () {
          context.read<CounterBloc>().add(
                IncrementCounterEvent(),
              );
        },
        child: const Text('Increment'));
  }
}
