import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_data_api/bloc/user_bloc.dart';
import 'package:user_data_api/bloc/user_event.dart';
import 'package:user_data_api/bloc/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
                leading: ClipOval(
                  child: Image.network(
                    user.avatar,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(
                UserEventGetUser(),
              );
          context.read<UserBloc>().add(
                const UserEventLogin(
                  userName: 'Amey',
                  email: 'amey@gmail.com',
                  password: 'amey@123',
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
