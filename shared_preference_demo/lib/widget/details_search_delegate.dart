import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_event.dart';
import 'package:shared_preference_demo/widget/detail_list_builder.dart';

class DetailsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context); 
        },
        icon: const Icon(Icons.clear_sharp),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    log('query : $query');
    context.read<DetailBloc>().add(
          DetailEventShowInfo(query: query),
        );
    return const DetailListBuilder();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    log('query : $query');
    context.read<DetailBloc>().add(
          DetailEventShowInfo(query: query),
        );
    return const DetailListBuilder();
  }
}
