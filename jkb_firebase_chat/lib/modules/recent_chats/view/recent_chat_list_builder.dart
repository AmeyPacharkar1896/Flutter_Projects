import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/bloc/recent_chats_bloc.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/view/recent_chats_list_tile.dart';

class RecentChatListBuilder extends StatefulWidget {
  const RecentChatListBuilder({super.key});

  @override
  State<RecentChatListBuilder> createState() => _RecentChatListBuilderState();
}

class _RecentChatListBuilderState extends State<RecentChatListBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<RecentChatsBloc>().add(
          const RecentChatsEventInitialize(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentChatsBloc, RecentChatsState>(
        builder: (context, state) {
      if (state is RecentChatsStateInitial) {
        return const Center(
          child: Text('No recentChats Found!!'),
        );
      } else if (state is RecentChatsStateLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is RecentChatsStateLoaded) {
        final chatList = state.chats;
        if (chatList.isEmpty) {
          return const Center(child: Text("No recent chats found."));
        }
        return ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            final chat = chatList[index];
            return RecentChatListTile(
              chat: chat,
            );
          },
        );
      } else {
        return const Center(child: Text("Something went wrong."));
      }
    });
  }
}
