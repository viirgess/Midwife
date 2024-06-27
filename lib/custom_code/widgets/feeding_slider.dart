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

import 'package:syncfusion_flutter_sliders/sliders.dart';

class FeedingSlider extends StatefulWidget {
  const FeedingSlider({
    super.key,
    this.width,
    this.height,
    required this.isLeft,
    required this.isPump,
  });

  final double? width;
  final double? height;
  final bool isLeft;
  final bool isPump;

  @override
  State<FeedingSlider> createState() => _SliderState();
}

class _SliderState extends State<FeedingSlider> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    if (!widget.isPump) {
      if (FFAppState().bottleFeeding == 0) {
        _value = 0;
      } else {
        _value = FFAppState().bottleFeeding.toDouble();
      }
    } else {
      if (widget.isLeft) {
        if (FFAppState().leftPump == 0) {
          _value = 0;
        } else {
          _value = FFAppState().leftPump.toDouble();
        }
      } else {
        if (FFAppState().rightPump == 0) {
          _value = 0;
        } else {
          _value = FFAppState().rightPump.toDouble();
        }
      }
    }

    return Container(
      child: SfSlider(
        min: 0.0,
        max: 350.0,
        value: _value,
        interval: 50,
        showTicks: true,
        showLabels: true,
        enableTooltip: false,
        activeColor: FlutterFlowTheme.of(context).secondary,
        inactiveColor: FlutterFlowTheme.of(context).customColor1,
        stepSize: 10,
        thumbIcon: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: FlutterFlowTheme.of(context).secondary, width: 2)),
        ),
        minorTicksPerInterval: 1,
        onChanged: (dynamic value) {
          setState(() {
            _value = value;
            if (!widget.isPump) {
              FFAppState().update(() {
                FFAppState().bottleFeeding = (value as double).floor();
              });
            } else {
              widget.isLeft
                  ? FFAppState().update(() {
                      FFAppState().leftPump = (value as double).floor();
                    })
                  : FFAppState().update(() {
                      FFAppState().rightPump = (value as double).floor();
                    });
            }
          });
        },
      ),
    );
  }
}
