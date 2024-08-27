import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState(selectedIndex: 0)) {
    on<HomeScreenEvent>(_onHomeScreenEvent);
  }

  FutureOr<void> _onHomeScreenEvent(
    HomeScreenEvent event,
    Emitter<HomeScreenState> emit,
  ) {
    emit(
      HomeScreenState(selectedIndex: event.changedIndex),
    );
  }
}
