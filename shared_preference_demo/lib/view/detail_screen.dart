import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_event.dart';
import 'package:shared_preference_demo/bloc/detail_state.dart';

import '../widget/custom_text_form_field_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  int? indexForEdit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference Demo'),
      ),
      body: Column(
        children: [
          CustomTextFormFieldWidget(
            controller: userNameController,
            icon: Icons.person,
            labelString: 'Username',
            hintString: 'Enter your username',
          ),
          CustomTextFormFieldWidget(
            controller: ageController,
            icon: Icons.calendar_month_rounded,
            labelString: 'Age',
            hintString: 'Enter your age',
          ),
          ElevatedButton(
            onPressed: () {
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
                context.read<DetailBloc>().add(DetailEventSaveInfo(
                      userDetail: userDetail,
                      index: indexForEdit,
                    ));
                userNameController.clear();
                ageController.clear();
                indexForEdit = null;
              }
            },
            child: const Text('Save'),
          ),
          BlocBuilder<DetailBloc, DetailState>(
            builder: ((context, state) {
              if (state is DetailStateInitial) {
                context.read<DetailBloc>().add(DetailEventShowInfo());
              } else if (state is DetailStateLoading) {
                return const CircularProgressIndicator();
              } else if (state is DetailStateLoaded) {
                final userList = state.userDetail;
                return Expanded(
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: ((context, index) {
                      final user = userList[index];
                      List<String> userData =
                          user.split('||').map((str) => str.trim()).toList();
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(userData[0]),
                        subtitle: Text(userData[1]),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<DetailBloc>().add(
                                    DetalEventDeleteInfo(index: index),
                                  );
                            },
                            icon: const Icon(Icons.delete)),
                        onTap: () {
                          userNameController.text = userData[0];
                          ageController.text = userData[1];
                          indexForEdit = index;
                        },
                      );
                    }),
                  ),
                );
              }
              return Container();
            }),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    ageController.dispose();
  }
}
