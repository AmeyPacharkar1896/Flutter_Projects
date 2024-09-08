import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/search_page.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({
    super.key,
    required this.admin,
    required this.isCreated,
  });

  final UserModel admin;
  final bool isCreated;

  @override
  GroupScreenState createState() => GroupScreenState();
}

class GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GroupBloc>().add(
          GroupEventInitialize(isCreated: widget.isCreated),
        );
    _messageController = TextEditingController();
    final bloc = context.read<GroupBloc>();
    bloc.messageController = _messageController;
  }

  late final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Group Chat'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SearchPage(
                        isGroupMemberSearch: true,
                        groupId: state.groupId,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  reverse: true,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    log(message.senderName);
                    log(message.toString());
                    return ListTile(
                      title: Text(message.senderName),
                      subtitle: Text(message.text),
                      textColor: Colors.blue,
                      style: ListTileStyle.list,
                    );
                    // return MessageListTile(messageModel: message);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelText: 'Type a message',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (_messageController.text.isNotEmpty) {
                          log(_messageController.text);
                          context.read<GroupBloc>().add(
                                GroupEventSendGroupMessage(
                                  message: _messageController.text,
                                ),
                              );
                          context.read<GroupBloc>().add(
                                const GroupEventInitialize(isCreated: true),
                              );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
