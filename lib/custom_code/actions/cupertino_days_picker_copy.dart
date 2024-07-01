// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mama_mentor/components/save_button/save_button_widget.dart';

import 'package:flutter/cupertino.dart';

Future<int> cupertinoDaysPickerCopy(BuildContext context) async {
  // Add your function code here!
  int _selectedDays = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
        ),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  final widget = CupertinoPicker(
    magnification: 1.22,
    squeeze: 1.2,
    useMagnifier: true,
    itemExtent: _kItemExtent,
    // This sets the initial item.
    scrollController: FixedExtentScrollController(
      initialItem: _selectedDays,
    ),
    // This is called when selected item is changed.
    onSelectedItemChanged: (int selectedItem) {
      _selectedDays = selectedItem;
      FFAppState().update(() {
        FFAppState().cycleDuration = (_selectedDays + 21);
      });
    },
    children: List<Widget>.generate(weeks.length, (int index) {
      return Center(child: Text(weeks[index]));
    }),
  );

  _showDialog(widget);

  return _selectedDays;
}

const double _kItemExtent = 32.0;
const List<String> weeks = <String>[
  '21 days',
  '22 days',
  '23 days',
  '24 days',
  '25 days',
  '26 days',
  '27 days',
  '28 days',
  '29 days',
  '30 days',
  '31 days',
  '32 days',
  '33 days',
  '34 days',
  '35 days',
];
