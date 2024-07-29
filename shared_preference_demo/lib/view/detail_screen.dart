import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_event.dart';
import 'package:shared_preference_demo/widget/details_search_delegate.dart';
import 'package:shared_preference_demo/widget/detail_list_builder.dart';
import 'package:shared_preference_demo/widget/text_field_form_builder.dart';
import 'package:shared_preference_demo/utils/detail_utils.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  int? editIndex;

  DetailScreen({super.key});

  void _resetEditIndex() {
    editIndex = null;
  }

  void _setEditIndex(int index) {
    editIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference Demo'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: DetailsSearchDelegate(), 
              ).whenComplete(() {
                context.read<DetailBloc>().add(DetailEventShowInfo());
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          CustomTextFormFieldBuilder(
            userNameController: userNameController,
            ageController: ageController,
            onSave: () => DetailUtils.saveUserDetail(
              context: context,
              userNameController: userNameController,
              ageController: ageController,
              editIndex: editIndex,
              resetEditIndex: _resetEditIndex,
            ),
          ),
          Expanded(
            child: DetailListBuilder(
              onEdit: (context, user, index) => DetailUtils.editUserDetail(
                userNameController: userNameController,
                ageController: ageController,
                user: user,
                index: index,
                setEditIndex: _setEditIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//string = 'userNamecontroller.text || ageController.text'