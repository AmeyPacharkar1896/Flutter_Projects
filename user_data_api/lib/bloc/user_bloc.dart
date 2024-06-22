import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/user_event.dart';
import 'package:user_data_api/bloc/user_state.dart';
import 'package:user_data_api/service/user_api_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(users: [])) {
    on<UserEventGetUser>(_onUserEventGetUser);
    on<UserEventLogin>(_onUserEventLogin);
  }

  final UserApiService _apiService = UserApiService();
  
  Future<FutureOr<void>> _onUserEventGetUser(
    UserEventGetUser event,
    Emitter<UserState> emit,
  ) async {
    final response = await _apiService.getAllUsers();
    if(response != null) {
      emit(
        UserState(users: response.data)
      );
    }
  }

  FutureOr<void> _onUserEventLogin(
    UserEventLogin event,
    Emitter<UserState> emit,
  ) {
    _apiService.login();
  }
}
