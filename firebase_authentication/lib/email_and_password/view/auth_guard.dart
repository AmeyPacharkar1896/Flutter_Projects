import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/email_and_password/bloc/auth_bloc.dart';
import 'package:jkb_firebase_chat/email_and_password/view/auth_screen.dart';
import 'package:jkb_firebase_chat/products/view/product_screen/product_page.dart';
// import 'package:jkb_firebase_chat/email_and_password/view/home_screen.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isAuthenticated) {
          return const ProductPage();
        }
        return const AuthScreen();
      },
    );
  }
}
