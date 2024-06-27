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

import '/custom_code/widgets/slidable_widget_name.dart';

class ReorderableListNames extends StatefulWidget {
  const ReorderableListNames({
    super.key,
    this.width,
    this.height,
    required this.items,
    required this.authRef,
  });

  final double? width;
  final double? height;
  final List<BabyNameStruct> items;
  final String authRef;
  @override
  State<ReorderableListNames> createState() => _ReorderableListNamesState();
}

class _ReorderableListNamesState extends State<ReorderableListNames> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 400,
        child: ReorderableListView(
          buildDefaultDragHandles: false,
          onReorder: (int oldIndex, int newIndex) async {
            // Remove the object at the old index
            // final removedObject = widget.items.removeAt(oldIndex);

            setState(() {
              final removedObject = widget.items.removeAt(oldIndex);

              // Calculate adjusted new index (considering order shift)
              int adjustedNewIndex =
                  newIndex > oldIndex ? newIndex - 1 : newIndex;
              // Insert removed object at adjusted new index
              widget.items.insert(adjustedNewIndex, removedObject);
            });

            final updatedListOfNames = widget.items.map(
              (e) => {
                "Name": e.name,
                "Sex": e.sex,
              },
            );

            // Update the user document with the reordered liked_names
            // (Replace 'users' with your actual user collection reference)
            if (widget.items.first.sex == "Girl") {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.authRef)
                  .update({
                'liked_names_girl': updatedListOfNames,
              });
            }

            if (widget.items.first.sex == "Boy") {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.authRef)
                  .update({
                'liked_names_boy': updatedListOfNames,
              });
            }
          },
          children: [
            for (final item in widget.items.toList().asMap().entries)
              ReorderableDragStartListener(
                key: ValueKey(item),
                index: item.key,
                child: SlidableWidgetName(
                  index: item.key,
                  name: item.value.name,
                  authRef: widget.authRef,
                  sex: item.value.sex,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
