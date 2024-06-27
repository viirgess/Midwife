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

import 'package:mama_mentor/trackers/feeding/pump_feeding_list_item/pump_feeding_list_item_widget.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class SlidablePumpFeedingItem extends StatefulWidget {
  const SlidablePumpFeedingItem({
    super.key,
    this.width,
    this.height,
    required this.editValue,
    required this.pumpFeeding,
  });

  final double? width;
  final double? height;
  final Future Function() editValue;
  final PumpFeedinStruct pumpFeeding;
  @override
  State<SlidablePumpFeedingItem> createState() => _SlidableWeightItemState();
}

class _SlidableWeightItemState extends State<SlidablePumpFeedingItem> {
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
        child: PumpFeedingListItemWidget(
          pumpFeeding: widget.pumpFeeding,
        ));
  }
}
