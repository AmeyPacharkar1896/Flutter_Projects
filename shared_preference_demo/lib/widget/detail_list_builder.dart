import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_event.dart';
import 'package:shared_preference_demo/bloc/detail_state.dart';
// import 'package:shared_preference_demo/widget/custom_text_widget.dart';

class DetailListBuilder extends StatelessWidget {
  const DetailListBuilder({
    this.onEdit,
    super.key,
  });

  final void Function(BuildContext, String, int)? onEdit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: ((context, state) {
        if (state is DetailStateInitial) {
          context.read<DetailBloc>().add(DetailEventShowInfo());
        } else if (state is DetailStateLoading) {
          return const CircularProgressIndicator();
        } else if (state is DetailStateLoaded) {
          final userList = state.userDetail;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: ((context, index) {
              final user = userList[index];
              List<String> userData =
                  user.split('||').map((str) => str.trim()).toList();
              return ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                title: Text(userData[0]),
                subtitle: Text(userData[1]),
                trailing: IconButton(
                  onPressed: () {
                    context.read<DetailBloc>().add(
                          DetalEventDeleteInfo(index: index),
                        );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  if (onEdit != null) {
                    onEdit!(context, user, index);
                  }
                },
              );
            }),
          );
        }
        return Container();
      }),
    );
  }
}
