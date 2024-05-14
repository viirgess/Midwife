// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_slidable/flutter_slidable.dart';
import '/chat/message_box/message_box_widget.dart';

class SlidableWidget extends StatefulWidget {
  const SlidableWidget({
    super.key,
    this.width,
    this.height,
    required this.user,
    required this.userA,
    required this.userB,
    required this.timeStamp,
    required this.isSeen,
    required this.lastMessage,
    required this.chatDocument,
    required this.deleteAction,
  });

  final double? width;
  final double? height;
  final DocumentReference user;
  final DocumentReference userA;
  final DocumentReference userB;
  final String timeStamp;
  final bool isSeen;
  final String lastMessage;
  final DocumentReference chatDocument;
  final Future Function() deleteAction;

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
        // Specify a key if the Slidable is dismissible.
        key: const ValueKey(0),
        // The end action pane is the one at the right or the bottom side.

        endActionPane: ActionPane(
          // dismissible: DismissiblePane(onDismissed: () {}),
          motion: ScrollMotion(),
          dragDismissible: true,
          extentRatio: 0.3,
          children: [
            SlidableAction(
              onPressed: (context) => widget.deleteAction(),
              backgroundColor: Color.fromRGBO(255, 68, 102, 1),
              foregroundColor: Colors.white,
              icon: Icons.delete_outlined,
              autoClose: true,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
              label: 'Delete',
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: MessageBoxWidget(
          user: widget.user,
          userA: widget.userA,
          userB: widget.userB,
          timeStamp: widget.timeStamp,
          isSeen: widget.isSeen,
          lastMessage: widget.lastMessage,
          chatDocument: widget.chatDocument,
        ));
  }
}
