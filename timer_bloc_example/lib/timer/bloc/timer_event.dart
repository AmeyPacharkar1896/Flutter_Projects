part of 'timer_bloc.dart';

abstract class TimerEvent {
  const TimerEvent();
}

class TimerEventStarted extends TimerEvent {
  TimerEventStarted({required this.duration});

  final int duration;
}

class TimerEventPaused extends TimerEvent {
  const TimerEventPaused();
}

class TimerEventResumed extends TimerEvent {
  const TimerEventResumed();
}

class TimerEventReset extends TimerEvent {
  const TimerEventReset();
}

class _TimerEventTicked extends TimerEvent {
  _TimerEventTicked({required this.duration});
  final int duration;
}