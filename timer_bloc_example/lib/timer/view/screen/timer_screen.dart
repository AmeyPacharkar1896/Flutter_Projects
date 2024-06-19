import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc_example/theme/view/screen/setting_page.dart';
import 'package:timer_bloc_example/ticker.dart';
import 'package:timer_bloc_example/timer/bloc/timer_bloc.dart';
import 'package:timer_bloc_example/timer/view/widget/timer_widget.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Timer Bloc Example',
          ),
        ),
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (context) => TimerBloc(ticker: const Ticker()),
            child: const TimerWidget(),
          ),
          BlocProvider(
            create: (context) => TimerBloc(ticker: const Ticker()),
            child: const TimerWidget(),
          ),
          // BlocBuilder<TimerBlocOne, TimerState>(
          //   builder: (context, state) {
          //   return ;
          // }, ),
          // BlocBuilder<TimerBlocTwo, TimerState>(builder: (context, state) {
          //   return TimerWidget();
          // },),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingPage()));
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
