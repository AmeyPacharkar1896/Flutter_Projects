import 'dart:developer';

import 'package:http/http.dart';
import 'package:user_data_api/model/user_info_details.dart';

class UserApiService {
  final Client client = Client();

  Future<UserInfoDetails?> getAllUsers() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
      final response = await client.get(uri);
      // log(response.body.toString());
      // log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return UserInfoDetails.fromJson(response.body);
      } else {
        log('response failed');
        return null;
      }
    } catch (e) {
      log('Something went wrong');
      log(e.toString());
      return null;
    }
  }
}