import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_bloc.dart';
// import 'package:shared_preference_demo/view/detail_page.dart';
import 'package:shared_preference_demo/view/detail_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DetailBloc(),
      child: MaterialApp(
        // theme: ThemeData.dark(
        //   useMaterial3: true,
        // ),
        debugShowCheckedModeBanner: false,
        home: DetailScreen(),
      ),
    ),
  );
}
