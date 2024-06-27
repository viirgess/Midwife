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
import 'package:mama_mentor/trackers/weight_tracker/weight_list_item/weight_list_item_widget.dart';

class SlidableWeightItem extends StatefulWidget {
  const SlidableWeightItem({
    super.key,
    this.width,
    this.height,
    required this.date,
    required this.weight,
    required this.difference,
    required this.week,
    required this.editValue,
    required this.isBaby,
    required this.isHeight,
  });

  final double? width;
  final double? height;
  final String date;
  final double weight;
  final double difference;
  final DateTime week;
  final Future Function() editValue;
  final bool isBaby;
  final bool isHeight;

  @override
  State<SlidableWeightItem> createState() => _SlidableWeightItemState();
}

class _SlidableWeightItemState extends State<SlidableWeightItem> {
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
          extentRatio: 0.2,
          children: [
            SlidableAction(
              onPressed: (context) => widget.editValue(),
              backgroundColor: FlutterFlowTheme.of(context).customColor1,
              foregroundColor: FlutterFlowTheme.of(context).secondary,
              icon: Icons.edit,
              autoClose: true,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
              label: 'Edit',
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: WeightListItemWidget(
            date: widget.date,
            weight: widget.weight,
            difference: widget.difference,
            week: widget.week,
            isBaby: widget.isBaby,
            isHeight: widget.isHeight));
  }
}
