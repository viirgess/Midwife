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

Future<bool?> categoryPicker(BuildContext context) async {
  // Add your function code here!
  // Add your function code here!
  int _selectedCategory = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
        ),
        height: 350,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.

        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  final category = CupertinoPicker(
    magnification: 1.22,
    squeeze: 1.2,
    useMagnifier: true,
    itemExtent: _kItemExtent,
    // This sets the initial item.
    scrollController: FixedExtentScrollController(
      initialItem: _selectedCategory,
    ),
    // This is called when selected item is changed.
    onSelectedItemChanged: (int selectedItem) {
      _selectedCategory = selectedItem;
      late SupportCategory category;
      FFAppState().update(() {
        if (_selectedCategory == 0) {
          category = SupportCategory.Question;
        } else if (_selectedCategory == 1) {
          category = SupportCategory.Suggestion;
        } else if (_selectedCategory == 2) {
          category = SupportCategory.Problem;
        } else {
          category = SupportCategory.Other;
        }
        FFAppState().categorySupport = category;
      });
    },
    children: List<Widget>.generate(_categories.length, (int index) {
      return Center(child: Text('${_categories[index]}'));
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
          'Select category',
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
              Expanded(child: category),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0).copyWith(bottom: 50),
          child: SaveButtonWidget(text: 'Save'),
        ),
      ],
    ),
  ));

  return true;
}

List<String> generateListOfWeights(int min, int max) {
  return [];
}

const double _kItemExtent = 32.0;

const List<String> _categories = <String>[
  'Question',
  'Suggestion',
  'Problem',
  'Other',
];
