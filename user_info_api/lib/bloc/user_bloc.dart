import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/user_event.dart';
import 'package:user_data_api/bloc/user_state.dart';
import 'package:user_data_api/model/user_info_details.dart';
import 'package:user_data_api/service/user_api_service.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoState(userdetails: [])) {
    on<UserInfoEventGetUser>(_onUserInfoEventGetUser);
  }

  final UserApiService _apiService = UserApiService();

  Future<FutureOr<void>> _onUserInfoEventGetUser(
    UserInfoEventGetUser event,
    Emitter<UserInfoState> emit,
  ) async {
    final response = await _apiService.getAllUsers();
    if (response != null) {
      // Assuming the response data is a JSON array of users
      final List<UserInfoDetails> users = (response as List)
          .map((user) => UserInfoDetails.fromMap(user as Map<String, dynamic>))
          .toList();

      emit(
        UserInfoState(userdetails: users),
      );
    }
  }
}
