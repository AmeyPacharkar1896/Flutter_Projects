import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_event.dart';

class DetailUtils {
  static void saveUserDetail({
    required BuildContext context,
    required TextEditingController userNameController,
    required TextEditingController ageController,
    required int? editIndex,
    required Function resetEditIndex,
  }) {
    int? age = int.tryParse(ageController.text);
    if (age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid age'),
        ),
      );
    } else {
      final String userDetail =
          '${userNameController.text} || ${ageController.text}';
      context.read<DetailBloc>().add(
            DetailEventSaveInfo(userDetail: userDetail, index: editIndex),
          );
      userNameController.clear();
      ageController.clear();
      resetEditIndex();
    }
  }

  static void editUserDetail({
    required TextEditingController userNameController,
    required TextEditingController ageController,
    required String user,
    required int index,
    required Function setEditIndex,
  }) {
    List<String> userData = user.split('||').map((str) => str.trim()).toList();
    userNameController.text = userData[0];
    ageController.text = userData[1];
    setEditIndex(index);
  }
}
