import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/modules/home/bloc/home_screen_bloc.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/bloc/recent_chats_bloc.dart';
import 'package:jkb_firebase_chat/modules/recent_chats/view/recent_chat_list_builder.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/search_page.dart';
import 'package:jkb_firebase_chat/modules/setting/view/setting_page.dart';
import 'package:jkb_firebase_chat/modules/status/view/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchBarController = SearchController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<RecentChatsBloc>().add(
          const RecentChatsEventInitialize(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const SearchPage()),
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Setting'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const SettingPage(),
                        ));
                      },
                    ),
                  ])
        ],
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: ((context, state) {
          return buildBody(state.selectedIndex);
        }),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          context.read<HomeScreenBloc>().add(
                HomeScreenEvent(changedIndex: value),
              );
              log(value.toString());
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.update_sharp),
            label: 'Status',
          ),
        ],
      ),
    );
  }

  Widget buildBody(int selectedIndex) {
    if (selectedIndex == 0) {
      return const RecentChatListBuilder();
    }
    return const StatusScreen();
  }
}
