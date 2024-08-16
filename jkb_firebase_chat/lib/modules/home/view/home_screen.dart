import 'package:flutter/material.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/search_page.dart';
import 'package:jkb_firebase_chat/modules/search_user/view/widget/search_list_view_builder.dart';
import 'package:jkb_firebase_chat/modules/setting/view/setting_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchBarController = SearchController();

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
      body: const SearchListViewBuilder(),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: Icon(Icons.update_sharp),
          label: 'Status',
        ),
      ]),
    );
  }

  
}
