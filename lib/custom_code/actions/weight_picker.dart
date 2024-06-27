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

Future<double> weightPicker(
  BuildContext context,
  bool isCurrent,
) async {
  // Add your function code here!
  // Add your function code here!
  int _selectedKg = FFAppState().currentWeight.floor() == 0
      ? 20
      : FFAppState().currentWeight.floor() - 35;
  int _selectedGrams = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 350,
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

  final kg = CupertinoPicker(
    magnification: 1.22,
    squeeze: 1.2,
    useMagnifier: true,
    itemExtent: _kItemExtent,
    // This sets the initial item.
    scrollController: FixedExtentScrollController(
      initialItem: _selectedKg,
    ),
    // This is called when selected item is changed.
    onSelectedItemChanged: (int selectedItem) {
      _selectedKg = selectedItem;
      isCurrent
          ? FFAppState().update(() {
              FFAppState().currentWeight =
                  _selectedKg + 35 + (_selectedGrams / 10);
            })
          : FFAppState().update(() {
              FFAppState().initWeight =
                  _selectedKg + 35 + (_selectedGrams / 10);
            });
    },
    children: List<Widget>.generate(84, (int index) {
      return Center(child: Text('${index + 35}'));
    }),
  );

  final grams = CupertinoPicker(
    magnification: 1.22,
    squeeze: 1.2,
    useMagnifier: true,
    itemExtent: _kItemExtent,
    // This sets the initial item.
    scrollController: FixedExtentScrollController(
      initialItem: _selectedGrams,
    ),
    // This is called when selected item is changed.
    onSelectedItemChanged: (int selectedItem) {
      _selectedGrams = selectedItem;
      isCurrent
          ? FFAppState().update(() {
              FFAppState().currentWeight =
                  _selectedKg + 35 + (_selectedGrams / 10);
            })
          : FFAppState().update(() {
              FFAppState().initWeight =
                  _selectedKg + 35 + (_selectedGrams / 10);
            });
    },
    children: List<Widget>.generate(gramList.length, (int index) {
      return Center(child: Text(gramList[index]));
    }),
  );

  _showDialog(Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Container(
          width: 70,
          height: 4,
          decoration: BoxDecoration(
            color: Color.fromRGBO(236, 237, 238, 1),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(height: 32),
        Text(
          'Select weight',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Figtree',
              fontSize: 24,
              color: Color.fromRGBO(36, 34, 36, 1),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Row(
            children: [
              Expanded(child: kg),
              Expanded(child: grams),
            ],
          ),
        ),
      ],
    ),
  ));

  return _selectedKg + (_selectedGrams / 1000);
}

List<String> generateListOfWeights(int min, int max) {
  return [];
}

const double _kItemExtent = 32.0;

const List<String> gramList = <String>[
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
];
