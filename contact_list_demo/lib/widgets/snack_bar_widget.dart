// import 'package:flutter/material.dart';
// import ''

// class SnackBarWidget extends StatefulWidget {
//   const SnackBarWidget({super.key, required this.onTap, required this.message});

//   final void Function() onTap;
//   final String message;
//   @override
//   State<SnackBarWidget> createState() => _SnackBarWidgetState();
// }

// class _SnackBarWidgetState extends State<SnackBarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
//               action: SnackBarAction(
//                 label: 'Undo',
//                 onPressed: () {
//                   setState(() {
//                     widget.onTap.call();
//                     if (newContact != null) {
//                       contactList.remove(newContact);
//                     }
//                   });
//                 },
//               ),
//               content: Text(widget.message),
//               duration: const Duration(milliseconds: 1500),
//             );
//   }
// }

import 'package:contact_list_demo/main.dart';
import 'package:flutter/material.dart';

void showSnackBar(String message, void Function()? onTap) {
  scaffoldMessagerKey.currentState?.showSnackBar(
    SnackBar(
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            onTap!.call();
          }),
      content: Text(message),
      duration: const Duration(milliseconds: 1500),
    ),
  );
}
