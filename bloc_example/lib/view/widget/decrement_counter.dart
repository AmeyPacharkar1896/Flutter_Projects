import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../counter_bloc/counter_bloc.dart';
import '../../counter_bloc/counter_event.dart';

class DecrementCounter extends StatelessWidget {
  const DecrementCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(onPressed: () {
            context.read<CounterBloc>().add(
              DecrementCounterEvent(),
            );
          }, child: const Text('Decrement'));
  }
}