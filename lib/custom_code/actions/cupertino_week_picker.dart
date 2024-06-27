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

import 'package:flutter/cupertino.dart';

Future<int> cupertinoWeekPicker(BuildContext context) async {
  // Add your function code here!
  int _selectedWeek = 0;

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
      initialItem: _selectedWeek,
    ),
    // This is called when selected item is changed.
    onSelectedItemChanged: (int selectedItem) {
      _selectedWeek = selectedItem;
      FFAppState().update(() {
        FFAppState().weekForMemories = (_selectedWeek + 1);
      });
    },
    children: List<Widget>.generate(weeks.length, (int index) {
      return Center(child: Text(weeks[index]));
    }),
  );

  _showDialog(widget);

  return _selectedWeek;
}

const double _kItemExtent = 32.0;
const List<String> weeks = <String>[
  '1 week',
  '2 week',
  '3 week',
  '4 week',
  '5 week',
  '6 week',
  '7 week',
  '8 week',
  '9 week',
  '10 week',
  '11 week',
  '12 week',
  '13 week',
  '14 week',
  '15 week',
  '16 week',
  '17 week',
  '18 week',
  '19 week',
  '20 week',
  '21 week',
  '22 week',
  '23 week',
  '24 week',
  '25 week',
  '26 week',
  '27 week',
  '28 week',
  '29 week',
  '30 week',
  '31 week',
  '32 week',
  '33 week',
  '34 week',
  '35 week',
  '36 week',
  '37 week',
  '38 week',
  '39 week',
  '40 week',
];
