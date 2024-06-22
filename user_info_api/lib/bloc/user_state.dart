import 'package:user_data_api/model/user_info_details.dart';

class UserInfoState {
  UserInfoState({required this.userdetails});

  final List<UserInfoDetails> userdetails;
}

// class UserInfoLoadedState {
//   UserInfoLoadedState({required this.userdetails});

//   final List<UserInfoDetails> userdetails;
// }

// class UserInfoLoadingState extends UserInfoState {

// }