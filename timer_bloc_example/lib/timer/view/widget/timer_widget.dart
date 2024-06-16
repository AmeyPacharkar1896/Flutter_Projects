import 'package:flutter/widgets.dart';
import 'package:timer_bloc_example/timer/view/widget/timer_screen_action.dart';
import 'package:timer_bloc_example/timer/view/widget/timer_screen_text.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Center(child: TimerScreenText()),
        ),
        TimerScreenActions(),
      ],
    );
  }
}
