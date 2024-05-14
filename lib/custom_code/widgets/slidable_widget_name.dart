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
import '/baby_names/list_item_name/list_item_name_widget.dart';

class SlidableWidgetName extends StatefulWidget {
  const SlidableWidgetName({
    super.key,
    this.width,
    this.height,
    required this.index,
    required this.name,
    required this.authRef,
    required this.sex,
  });

  final double? width;
  final double? height;
  final int index;
  final String name;
  final String authRef;
  final String sex;

  @override
  State<SlidableWidgetName> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidgetName> {
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
              onPressed: (context) async {
                var listItems = [];
                final user = await FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.authRef)
                    .get();
                if (widget.sex == "Girl")
                  listItems = user.data()?["liked_names_girl"];

                if (widget.sex == "Boy")
                  listItems = user.data()?["liked_names_boy"];

                listItems.removeAt(widget.index);

                // Update the user document with the reordered liked_names
                // (Replace 'users' with your actual user collection reference)
                if (widget.sex == "Girl") {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.authRef)
                      .update({
                    'liked_names_girl': listItems,
                  });
                }

                if (widget.sex == "Boy") {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.authRef)
                      .update({
                    'liked_names_boy': listItems,
                  });
                }
              },
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
        child: ListItemNameWidget(index: widget.index, name: widget.name));
  }
}
