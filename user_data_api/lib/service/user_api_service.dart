import 'dart:developer';

import 'package:http/http.dart';
import 'package:user_data_api/model/get_user_response_model.dart';

class UserApiService {
  final Client client = Client();

  void login() async {
    final response = await client.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        "username": "string",
        "email": "string",
        "password": "string",
      },
    );
    log(response.body.toString());
  }

  Future<GetUserResponseModel?> getAllUsers() async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'reqres.in',
        path: 'api/users',
        queryParameters: {
          'page': '1',
          'per_page': '12',
        },
      );
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return GetUserResponseModel.fromJson(response.body);
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