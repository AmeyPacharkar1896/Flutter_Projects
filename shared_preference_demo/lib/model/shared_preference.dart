import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  late final SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setDetails(String userInput, int? index) async {
    try {
      List<String> userDetail = _preferences.getStringList('UserDetail') ?? [];
      if (index == null) {
        userDetail.add(userInput);
      } else {
        userDetail[index] = userInput;
      }
      await _preferences.setStringList('UserDetail', userDetail);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  List<String> getDetail(String? query) {
    List<String>? userDetail = _preferences.getStringList('UserDetail');
    if (userDetail != null) {
      if (query != null) {
        List<String> searchedDetails =
            userDetail.where((element) => element.contains(query)).toList();
        return searchedDetails;
      }
      return userDetail;
    }
    return [];
  }

  Future<void> deleteDetail(int index) async {
    List<String>? userDetail = _preferences.getStringList('UserDetail');
    if (userDetail != null) {
      userDetail.removeAt(index);
      await _preferences.setStringList('UserDetail', userDetail);
    }
  }
}

