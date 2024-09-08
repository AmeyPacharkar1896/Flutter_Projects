// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jkb_firebase_chat/modules/auth/model/user_model.dart';
// import 'package:jkb_firebase_chat/modules/groups/bloc/group_bloc.dart';
// import 'package:jkb_firebase_chat/modules/groups/view/chat_group/add_member_dialog.dart';
// import 'package:jkb_firebase_chat/modules/groups/view/chat_group/message_input.dart';
// import 'package:jkb_firebase_chat/modules/groups/view/chat_group/message_list.dart';

// class GroupChatScreen extends StatelessWidget {
//   final UserModel admin;
//   final String groupId;

//   GroupChatScreen({
//     required this.admin,
//     required this.groupId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           GroupBloc(admin: admin).add(const GroupEventInitialize()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Group Chat'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 // Implement add member functionality
//                 showDialog(
//                   context: context,
//                   builder: (context) => AddMemberDialog(groupId: groupId),
//                 );
//               },
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(child: MessageList(groupId: groupId)),
//             MessageInput(groupId: groupId),
//           ],
//         ),
//       ),
//     );
//   }
// }
