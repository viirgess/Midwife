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

import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  const LineChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.calculatedDate,
    required this.isBaby,
    required this.isHeight,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    required this.chartDataBabyWeight,
    this.dateOfBirth,
    required this.chartDataBabyHeight,
    required this.isGirl,
  });

  final double? width;
  final double? height;
  final List<WeightStruct> chartData;
  final DateTime calculatedDate;
  final bool isBaby;
  final bool isHeight;
  final int minX;
  final int maxX;
  final int minY;
  final int maxY;
  final List<BabyWeigthStruct> chartDataBabyWeight;
  final DateTime? dateOfBirth;
  final List<BabyHeightStruct> chartDataBabyHeight;
  final bool isGirl;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void didUpdateWidget(covariant LineChart oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.isBaby) {
      List<double> percentilesWeight = findPercentiles(
        widget.isGirl ? 'girl' : 'boy',
        calculateBabyAge(
                widget.dateOfBirth!, widget.chartDataBabyWeight.last.date!)
            .round(),
        widget.chartDataBabyWeight.last.weight,
        widget.chartDataBabyHeight.last.height,
      );

      List<double> percentilesHeight = findPercentiles(
        widget.isGirl ? 'girl' : 'boy',
        calculateBabyAge(
                widget.dateOfBirth!, widget.chartDataBabyHeight.last.date!)
            .round(),
        widget.chartDataBabyWeight.last.weight,
        widget.chartDataBabyHeight.last.height,
      );

      FFAppState().update(() {
        FFAppState().weightPercentile = percentilesWeight[0].roundToDouble();
        FFAppState().heightPercentile = percentilesHeight[1].roundToDouble();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _zoomPanBehavior = ZoomPanBehavior(
      // Enables pinch zooming
      enablePinching: true,
      enableSelectionZooming: true,
      enableDoubleTapZooming: true,
    );

    if (widget.isBaby) {
      List<double> percentilesWeight = findPercentiles(
        widget.isGirl ? 'girl' : 'boy',
        calculateBabyAge(
                widget.dateOfBirth!, widget.chartDataBabyWeight.last.date!)
            .round(),
        widget.chartDataBabyWeight.last.weight,
        widget.chartDataBabyHeight.last.height,
      );

      List<double> percentilesHeight = findPercentiles(
        widget.isGirl ? 'girl' : 'boy',
        calculateBabyAge(
                widget.dateOfBirth!, widget.chartDataBabyHeight.last.date!)
            .round(),
        widget.chartDataBabyWeight.last.weight,
        widget.chartDataBabyHeight.last.height,
      );

      FFAppState().update(() {
        FFAppState().weightPercentile = percentilesWeight[0].roundToDouble();
        FFAppState().heightPercentile = percentilesHeight[1].roundToDouble();
      });

      debugPrint(
          'weight percentile: ${percentilesWeight[0]}, height percentile: ${percentilesHeight[1]} ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height * 0.3,
      child: SfCartesianChart(
        primaryXAxis: NumericAxis(
          minimum: double.parse(widget.minX.toString()),
          maximum: double.parse(widget.maxX.toString()),
          interval: widget.isBaby ? 1 : 5,
        ),
        primaryYAxis: NumericAxis(
          minimum: double.parse(widget.minY.toString()),
          maximum: double.parse(widget.maxY.toString()),
        ),
        series: <CartesianSeries>[
          if (widget.isBaby)
            RangeAreaSeries<PercentileDataStruct, int>(
              dataSource: widget.isHeight
                  ? widget.isGirl
                      ? percentileDataHeightGirls1_99
                      : percentileDataHeightBoys1_99
                  : widget.isGirl
                      ? percentileDataWeightGirls1_99
                      : percentileDataWeightBoys1_99,
              xValueMapper: (PercentileDataStruct data, _) => data.age,
              lowValueMapper: (PercentileDataStruct data, _) => data.lowerBound,
              highValueMapper: (PercentileDataStruct data, _) =>
                  data.upperBound,
              name: 'Percentile Range',
              color: Color.fromRGBO(246, 241, 255, 1),
            ),
          if (widget.isBaby)
            RangeAreaSeries<PercentileDataStruct, int>(
              dataSource: widget.isHeight
                  ? widget.isGirl
                      ? percentileDataHeightGirls5_95
                      : percentileDataHeightBoys5_95
                  : widget.isGirl
                      ? percentileDataWeightGirls5_95
                      : percentileDataWeightBoys5_95,
              xValueMapper: (PercentileDataStruct data, _) => data.age,
              lowValueMapper: (PercentileDataStruct data, _) => data.lowerBound,
              highValueMapper: (PercentileDataStruct data, _) =>
                  data.upperBound,
              name: 'Percentile Range',
              color: Color.fromRGBO(241, 232, 255, 1),
            ),
          if (widget.isBaby)
            RangeAreaSeries<PercentileDataStruct, int>(
              dataSource: widget.isHeight
                  ? widget.isGirl
                      ? percentileDataHeightGirls10_90
                      : percentileDataHeightBoys10_90
                  : widget.isGirl
                      ? percentileDataWeightGirls10_90
                      : percentileDataWeightBoys10_90,
              xValueMapper: (PercentileDataStruct data, _) => data.age,
              lowValueMapper: (PercentileDataStruct data, _) => data.lowerBound,
              highValueMapper: (PercentileDataStruct data, _) =>
                  data.upperBound,
              name: 'Percentile Range',
              color: Color.fromRGBO(233, 221, 254, 1),
            ),
          if (widget.isBaby)
            RangeAreaSeries<PercentileDataStruct, int>(
              dataSource: widget.isHeight
                  ? widget.isGirl
                      ? percentileDataHeightGirls25_75
                      : percentileDataHeightBoys25_75
                  : widget.isGirl
                      ? percentileDataWeightGirls25_75
                      : percentileDataWeightBoys25_75,
              xValueMapper: (PercentileDataStruct data, _) => data.age,
              lowValueMapper: (PercentileDataStruct data, _) => data.lowerBound,
              highValueMapper: (PercentileDataStruct data, _) =>
                  data.upperBound,
              name: 'Percentile Range',
              color: Color.fromRGBO(224, 206, 255, 1),
            ),
          if (widget.isBaby)
            SplineSeries<SimpleLineCoordinates, int>(
              dataSource: widget.isHeight
                  ? widget.isGirl
                      ? simpleLineGirlsHeight
                      : simpleLineBoysHeight
                  : widget.isGirl
                      ? simpleLineGirlsWeight
                      : simpleLineBoysWeight,
              xValueMapper: (SimpleLineCoordinates data, _) => data.x,
              yValueMapper: (SimpleLineCoordinates data, _) => data.y,
              color: Color.fromRGBO(209, 183, 252, 1),
              width: 2.5,
            ),
          if (!widget.isBaby)
            LineSeries<WeightStruct, int>(
                dataSource: widget.chartData,
                color: FlutterFlowTheme.of(context).secondary,
                width: 3,
                xValueMapper: (WeightStruct data, _) =>
                    calculateWeek(widget.calculatedDate, data.date!),
                yValueMapper: (WeightStruct data, _) => data.weight,
                markerSettings:
                    MarkerSettings(isVisible: true, width: 12, height: 12)),
          if (widget.isBaby)
            if (!widget.isHeight)
              LineSeries<BabyWeigthStruct, double>(
                  dataSource: widget.chartDataBabyWeight,
                  color: FlutterFlowTheme.of(context).secondary,
                  width: 3,
                  xValueMapper: (BabyWeigthStruct data, _) =>
                      calculateBabyAge(widget.dateOfBirth!, data.date!),
                  yValueMapper: (BabyWeigthStruct data, _) => data.weight,
                  markerSettings:
                      MarkerSettings(isVisible: true, width: 12, height: 12)),
          if (widget.isBaby)
            if (widget.isHeight)
              LineSeries<BabyHeightStruct, double>(
                  dataSource: widget.chartDataBabyHeight,
                  color: FlutterFlowTheme.of(context).secondary,
                  width: 3,
                  xValueMapper: (BabyHeightStruct data, _) =>
                      calculateBabyAge(widget.dateOfBirth!, data.date!),
                  yValueMapper: (BabyHeightStruct data, _) => data.height,
                  markerSettings:
                      MarkerSettings(isVisible: true, width: 12, height: 12)),
        ],
        zoomPanBehavior: _zoomPanBehavior,
      ),
    );
  }
}

double calculatePercentile(double value, double lowerBound, double upperBound,
    double lowerPercentile, double upperPercentile) {
  if (value <= lowerBound) return lowerPercentile;
  if (value >= upperBound) return upperPercentile;
  // debugPrint(lowerPercentile +
  //     (upperPercentile - lowerPercentile) *
  //         (value - lowerBound) /
  //         (upperBound - lowerBound);
  return lowerPercentile +
      (upperPercentile - lowerPercentile) *
          (value - lowerBound) /
          (upperBound - lowerBound);
}

Map<String, List<PercentileDataStruct>> getPercentileData(
    String sex, String measure, double percentile) {
  if (sex == 'boy') {
    if (measure == 'weight') {
      if (percentile == 1) return {'1_99': percentileDataWeightBoys1_99};
      if (percentile == 5) return {'5_95': percentileDataWeightBoys5_95};
      if (percentile == 10) return {'10_90': percentileDataWeightBoys10_90};
      if (percentile == 25) return {'25_75': percentileDataWeightBoys25_75};
    } else if (measure == 'height') {
      if (percentile == 1) return {'1_99': percentileDataHeightBoys1_99};
      if (percentile == 5) return {'5_95': percentileDataHeightBoys5_95};
      if (percentile == 10) return {'10_90': percentileDataHeightBoys10_90};
      if (percentile == 25) return {'25_75': percentileDataHeightBoys25_75};
    }
  } else if (sex == 'girl') {
    if (measure == 'weight') {
      if (percentile == 1) return {'1_99': percentileDataWeightGirls1_99};
      if (percentile == 5) return {'5_95': percentileDataWeightGirls5_95};
      if (percentile == 10) return {'10_90': percentileDataWeightGirls10_90};
      if (percentile == 25) return {'25_75': percentileDataWeightGirls25_75};
    } else if (measure == 'height') {
      if (percentile == 1) return {'1_99': percentileDataHeightGirls1_99};
      if (percentile == 5) return {'5_95': percentileDataHeightGirls5_95};
      if (percentile == 10) return {'10_90': percentileDataHeightGirls10_90};
      if (percentile == 25) return {'25_75': percentileDataHeightGirls25_75};
    }
  }
  return {};
}

List<double> findPercentiles(
    String sex, int age, double weight, double height) {
  List<double> percentiles = [];

  List<double> percentileBounds = [
    1,
    5,
    10,
    25,
  ];

  double weightPercentile = 0;
  double heightPercentile = 0;

  for (var bound in percentileBounds) {
    var weightData = getPercentileData(sex, 'weight', bound);
    var heightData = getPercentileData(sex, 'height', bound);

    debugPrint('weightData:  ${weightData.toString()}');
    debugPrint('heightData:  ${heightData.toString()}');

    if (weightData.isNotEmpty && heightData.isNotEmpty) {
      var weightStruct = weightData.values
          .firstWhere((list) => list.any((element) => element.age == age))
          .firstWhere((element) => element.age == age,
              orElse: () =>
                  PercentileDataStruct(age: 0, lowerBound: 0, upperBound: 0));
      var heightStruct = heightData.values
          .firstWhere((list) => list.any((element) => element.age == age))
          .firstWhere((element) => element.age == age,
              orElse: () =>
                  PercentileDataStruct(age: 0, lowerBound: 0, upperBound: 0));

      weightPercentile = calculatePercentile(weight, weightStruct.lowerBound,
          weightStruct.upperBound, bound, 100 - bound);
      heightPercentile = calculatePercentile(height, heightStruct.lowerBound,
          heightStruct.upperBound, bound, 100 - bound);
    }
  }

  percentiles.add(weightPercentile);
  percentiles.add(heightPercentile);

  return percentiles;
}

class SimpleLineCoordinates {
  final int x;
  final double y;

  SimpleLineCoordinates(this.x, this.y);
}

final List<SimpleLineCoordinates> simpleLineBoysWeight = [
  SimpleLineCoordinates(0, 3.3),
  SimpleLineCoordinates(1, 4.5),
  SimpleLineCoordinates(2, 5.6),
  SimpleLineCoordinates(3, 6.4),
  SimpleLineCoordinates(4, 7),
  SimpleLineCoordinates(5, 7.5),
  SimpleLineCoordinates(6, 7.9),
  SimpleLineCoordinates(7, 8.3),
  SimpleLineCoordinates(8, 8.6),
  SimpleLineCoordinates(9, 8.9),
  SimpleLineCoordinates(10, 9.2),
  SimpleLineCoordinates(11, 9.4),
  SimpleLineCoordinates(12, 9.6),
];
final List<SimpleLineCoordinates> simpleLineGirlsWeight = [
  SimpleLineCoordinates(0, 3.2),
  SimpleLineCoordinates(1, 4.2),
  SimpleLineCoordinates(2, 5.1),
  SimpleLineCoordinates(3, 5.8),
  SimpleLineCoordinates(4, 6.4),
  SimpleLineCoordinates(5, 6.9),
  SimpleLineCoordinates(6, 7.3),
  SimpleLineCoordinates(7, 7.6),
  SimpleLineCoordinates(8, 7.9),
  SimpleLineCoordinates(9, 8.2),
  SimpleLineCoordinates(10, 8.5),
  SimpleLineCoordinates(11, 8.7),
  SimpleLineCoordinates(12, 8.9),
];
final List<SimpleLineCoordinates> simpleLineBoysHeight = [
  SimpleLineCoordinates(0, 49.9),
  SimpleLineCoordinates(1, 54.7),
  SimpleLineCoordinates(2, 58.4),
  SimpleLineCoordinates(3, 61.4),
  SimpleLineCoordinates(4, 63.9),
  SimpleLineCoordinates(5, 65.9),
  SimpleLineCoordinates(6, 67.6),
  SimpleLineCoordinates(7, 69.2),
  SimpleLineCoordinates(8, 70.6),
  SimpleLineCoordinates(9, 72),
  SimpleLineCoordinates(10, 73.3),
  SimpleLineCoordinates(11, 74.5),
  SimpleLineCoordinates(12, 75.7),
];
final List<SimpleLineCoordinates> simpleLineGirlsHeight = [
  SimpleLineCoordinates(0, 49.1),
  SimpleLineCoordinates(1, 53.7),
  SimpleLineCoordinates(2, 57.1),
  SimpleLineCoordinates(3, 59.8),
  SimpleLineCoordinates(4, 62.1),
  SimpleLineCoordinates(5, 64),
  SimpleLineCoordinates(6, 65.7),
  SimpleLineCoordinates(7, 67.3),
  SimpleLineCoordinates(8, 68.7),
  SimpleLineCoordinates(9, 70.1),
  SimpleLineCoordinates(10, 71.5),
  SimpleLineCoordinates(11, 72.8),
  SimpleLineCoordinates(12, 74),
];

final List<PercentileDataStruct> percentileDataWeightBoys1_99 = [
  PercentileDataStruct(age: 0, lowerBound: 2.3, upperBound: 4.6),
  PercentileDataStruct(age: 1, lowerBound: 3.2, upperBound: 6),
  PercentileDataStruct(age: 2, lowerBound: 4.1, upperBound: 7.4),
  PercentileDataStruct(age: 3, lowerBound: 4.8, upperBound: 8.3),
  PercentileDataStruct(age: 4, lowerBound: 5.4, upperBound: 9.1),
  PercentileDataStruct(age: 5, lowerBound: 5.8, upperBound: 9.7),
  PercentileDataStruct(age: 6, lowerBound: 6.1, upperBound: 10.2),
  PercentileDataStruct(age: 7, lowerBound: 6.4, upperBound: 10.7),
  PercentileDataStruct(age: 8, lowerBound: 6.7, upperBound: 11.1),
  PercentileDataStruct(age: 9, lowerBound: 6.9, upperBound: 11.4),
  PercentileDataStruct(age: 10, lowerBound: 7.1, upperBound: 11.8),
  PercentileDataStruct(age: 11, lowerBound: 7.3, upperBound: 12.1),
  PercentileDataStruct(age: 12, lowerBound: 7.5, upperBound: 12.4),
];

final List<PercentileDataStruct> percentileDataWeightBoys5_95 = [
  PercentileDataStruct(age: 0, lowerBound: 2.6, upperBound: 4.2),
  PercentileDataStruct(age: 1, lowerBound: 3.6, upperBound: 5.5),
  PercentileDataStruct(age: 2, lowerBound: 4.5, upperBound: 6.8),
  PercentileDataStruct(age: 3, lowerBound: 5.2, upperBound: 7.7),
  PercentileDataStruct(age: 4, lowerBound: 5.8, upperBound: 8.4),
  PercentileDataStruct(age: 5, lowerBound: 6.2, upperBound: 9),
  PercentileDataStruct(age: 6, lowerBound: 6.6, upperBound: 9.5),
  PercentileDataStruct(age: 7, lowerBound: 6.9, upperBound: 9.9),
  PercentileDataStruct(age: 8, lowerBound: 7.2, upperBound: 10.3),
  PercentileDataStruct(age: 9, lowerBound: 7.4, upperBound: 10.6),
  PercentileDataStruct(age: 10, lowerBound: 7.7, upperBound: 10.9),
  PercentileDataStruct(age: 11, lowerBound: 7.9, upperBound: 11.2),
  PercentileDataStruct(age: 12, lowerBound: 8.1, upperBound: 11.5),
];

final List<PercentileDataStruct> percentileDataWeightBoys10_90 = [
  PercentileDataStruct(age: 0, lowerBound: 2.8, upperBound: 4),
  PercentileDataStruct(age: 1, lowerBound: 3.8, upperBound: 5.3),
  PercentileDataStruct(age: 2, lowerBound: 4.7, upperBound: 6.5),
  PercentileDataStruct(age: 3, lowerBound: 5.5, upperBound: 7.4),
  PercentileDataStruct(age: 4, lowerBound: 6, upperBound: 8.1),
  PercentileDataStruct(age: 5, lowerBound: 6.5, upperBound: 8.6),
  PercentileDataStruct(age: 6, lowerBound: 6.9, upperBound: 9.1),
  PercentileDataStruct(age: 7, lowerBound: 7.2, upperBound: 9.5),
  PercentileDataStruct(age: 8, lowerBound: 7.5, upperBound: 9.9),
  PercentileDataStruct(age: 9, lowerBound: 7.7, upperBound: 10.2),
  PercentileDataStruct(age: 10, lowerBound: 8, upperBound: 10.5),
  PercentileDataStruct(age: 11, lowerBound: 8.2, upperBound: 10.8),
  PercentileDataStruct(age: 12, lowerBound: 8.4, upperBound: 11.1),
];

final List<PercentileDataStruct> percentileDataWeightBoys25_75 = [
  PercentileDataStruct(age: 0, lowerBound: 3, upperBound: 3.7),
  PercentileDataStruct(age: 1, lowerBound: 4.1, upperBound: 4.9),
  PercentileDataStruct(age: 2, lowerBound: 5.1, upperBound: 6),
  PercentileDataStruct(age: 3, lowerBound: 5.9, upperBound: 6.9),
  PercentileDataStruct(age: 4, lowerBound: 6.5, upperBound: 7.6),
  PercentileDataStruct(age: 5, lowerBound: 7, upperBound: 8.1),
  PercentileDataStruct(age: 6, lowerBound: 7.4, upperBound: 8.5),
  PercentileDataStruct(age: 7, lowerBound: 7.7, upperBound: 8.9),
  PercentileDataStruct(age: 8, lowerBound: 8, upperBound: 9.3),
  PercentileDataStruct(age: 9, lowerBound: 8.3, upperBound: 9.6),
  PercentileDataStruct(age: 10, lowerBound: 8.5, upperBound: 9.9),
  PercentileDataStruct(age: 11, lowerBound: 8.7, upperBound: 10.1),
  PercentileDataStruct(age: 12, lowerBound: 9, upperBound: 10.4),
];

final List<PercentileDataStruct> percentileDataHeightBoys1_99 = [
  PercentileDataStruct(age: 0, lowerBound: 44, upperBound: 54.3),
  PercentileDataStruct(age: 1, lowerBound: 48.7, upperBound: 59.3),
  PercentileDataStruct(age: 2, lowerBound: 52.2, upperBound: 63.1),
  PercentileDataStruct(age: 3, lowerBound: 55.1, upperBound: 66.2),
  PercentileDataStruct(age: 4, lowerBound: 57.5, upperBound: 68.7),
  PercentileDataStruct(age: 5, lowerBound: 59.4, upperBound: 70.8),
  PercentileDataStruct(age: 6, lowerBound: 61, upperBound: 72.6),
  PercentileDataStruct(age: 7, lowerBound: 62.5, upperBound: 74.2),
  PercentileDataStruct(age: 8, lowerBound: 63.8, upperBound: 75.7),
  PercentileDataStruct(age: 9, lowerBound: 65, upperBound: 77.2),
  PercentileDataStruct(age: 10, lowerBound: 66.2, upperBound: 78.6),
  PercentileDataStruct(age: 11, lowerBound: 67.3, upperBound: 80),
  PercentileDataStruct(age: 12, lowerBound: 68.4, upperBound: 81.3),
];

final List<PercentileDataStruct> percentileDataHeightBoys5_95 = [
  PercentileDataStruct(age: 0, lowerBound: 46.8, upperBound: 53),
  PercentileDataStruct(age: 1, lowerBound: 51.5, upperBound: 57.9),
  PercentileDataStruct(age: 2, lowerBound: 55.1, upperBound: 61.7),
  PercentileDataStruct(age: 3, lowerBound: 58.1, upperBound: 64.8),
  PercentileDataStruct(age: 4, lowerBound: 60.5, upperBound: 67.3),
  PercentileDataStruct(age: 5, lowerBound: 62.4, upperBound: 69.4),
  PercentileDataStruct(age: 6, lowerBound: 64.1, upperBound: 71.1),
  PercentileDataStruct(age: 7, lowerBound: 65.6, upperBound: 72.7),
  PercentileDataStruct(age: 8, lowerBound: 67, upperBound: 74.2),
  PercentileDataStruct(age: 9, lowerBound: 68.3, upperBound: 75.7),
  PercentileDataStruct(age: 10, lowerBound: 69.5, upperBound: 77),
  PercentileDataStruct(age: 11, lowerBound: 70.7, upperBound: 78.4),
  PercentileDataStruct(age: 12, lowerBound: 71.8, upperBound: 79.7),
];

final List<PercentileDataStruct> percentileDataHeightBoys10_90 = [
  PercentileDataStruct(age: 0, lowerBound: 47.5, upperBound: 52.3),
  PercentileDataStruct(age: 1, lowerBound: 52.2, upperBound: 57.2),
  PercentileDataStruct(age: 2, lowerBound: 55.9, upperBound: 61),
  PercentileDataStruct(age: 3, lowerBound: 58.8, upperBound: 64),
  PercentileDataStruct(age: 4, lowerBound: 61.2, upperBound: 66.6),
  PercentileDataStruct(age: 5, lowerBound: 63.2, upperBound: 68.6),
  PercentileDataStruct(age: 6, lowerBound: 64.9, upperBound: 70.4),
  PercentileDataStruct(age: 7, lowerBound: 66.4, upperBound: 71.9),
  PercentileDataStruct(age: 8, lowerBound: 67.8, upperBound: 73.4),
  PercentileDataStruct(age: 9, lowerBound: 69.1, upperBound: 74.8),
  PercentileDataStruct(age: 10, lowerBound: 70.4, upperBound: 76.2),
  PercentileDataStruct(age: 11, lowerBound: 71.6, upperBound: 77.5),
  PercentileDataStruct(age: 12, lowerBound: 72.7, upperBound: 78.8),
];

final List<PercentileDataStruct> percentileDataHeightBoys25_75 = [
  PercentileDataStruct(age: 0, lowerBound: 48.6, upperBound: 51.2),
  PercentileDataStruct(age: 1, lowerBound: 53.4, upperBound: 56),
  PercentileDataStruct(age: 2, lowerBound: 57.1, upperBound: 59.8),
  PercentileDataStruct(age: 3, lowerBound: 60.1, upperBound: 62.8),
  PercentileDataStruct(age: 4, lowerBound: 62.5, upperBound: 65.3),
  PercentileDataStruct(age: 5, lowerBound: 64.5, upperBound: 67.3),
  PercentileDataStruct(age: 6, lowerBound: 66.2, upperBound: 69.1),
  PercentileDataStruct(age: 7, lowerBound: 67.7, upperBound: 70.6),
  PercentileDataStruct(age: 8, lowerBound: 69.1, upperBound: 72.1),
  PercentileDataStruct(age: 9, lowerBound: 70.5, upperBound: 73.5),
  PercentileDataStruct(age: 10, lowerBound: 71.7, upperBound: 74.8),
  PercentileDataStruct(age: 11, lowerBound: 73, upperBound: 76.1),
  PercentileDataStruct(age: 12, lowerBound: 74.1, upperBound: 77.4),
];

final List<PercentileDataStruct> percentileDataWeightGirls1_99 = [
  PercentileDataStruct(age: 0, lowerBound: 2.3, upperBound: 4.4),
  PercentileDataStruct(age: 1, lowerBound: 3, upperBound: 5.7),
  PercentileDataStruct(age: 2, lowerBound: 3.8, upperBound: 6.9),
  PercentileDataStruct(age: 3, lowerBound: 4.4, upperBound: 7.8),
  PercentileDataStruct(age: 4, lowerBound: 4.8, upperBound: 8.6),
  PercentileDataStruct(age: 5, lowerBound: 5.2, upperBound: 9.2),
  PercentileDataStruct(age: 6, lowerBound: 5.5, upperBound: 9.7),
  PercentileDataStruct(age: 7, lowerBound: 5.8, upperBound: 10.2),
  PercentileDataStruct(age: 8, lowerBound: 6, upperBound: 10.6),
  PercentileDataStruct(age: 9, lowerBound: 6.2, upperBound: 11),
  PercentileDataStruct(age: 10, lowerBound: 6.4, upperBound: 11.3),
  PercentileDataStruct(age: 11, lowerBound: 6.6, upperBound: 11.7),
  PercentileDataStruct(age: 12, lowerBound: 6.8, upperBound: 12),
];

final List<PercentileDataStruct> percentileDataWeightGirls5_95 = [
  PercentileDataStruct(age: 0, lowerBound: 2.5, upperBound: 4),
  PercentileDataStruct(age: 1, lowerBound: 3.3, upperBound: 5.2),
  PercentileDataStruct(age: 2, lowerBound: 4.1, upperBound: 6.3),
  PercentileDataStruct(age: 3, lowerBound: 4.7, upperBound: 7.2),
  PercentileDataStruct(age: 4, lowerBound: 5.2, upperBound: 7.9),
  PercentileDataStruct(age: 5, lowerBound: 5.6, upperBound: 8.4),
  PercentileDataStruct(age: 6, lowerBound: 6, upperBound: 8.9),
  PercentileDataStruct(age: 7, lowerBound: 6.3, upperBound: 9.4),
  PercentileDataStruct(age: 8, lowerBound: 6.5, upperBound: 9.7),
  PercentileDataStruct(age: 9, lowerBound: 6.8, upperBound: 10.1),
  PercentileDataStruct(age: 10, lowerBound: 7, upperBound: 10.4),
  PercentileDataStruct(age: 11, lowerBound: 7.2, upperBound: 10.7),
  PercentileDataStruct(age: 12, lowerBound: 7.3, upperBound: 11),
];

final List<PercentileDataStruct> percentileDataWeightGirls10_90 = [
  PercentileDataStruct(age: 0, lowerBound: 2.7, upperBound: 3.9),
  PercentileDataStruct(age: 1, lowerBound: 3.5, upperBound: 5),
  PercentileDataStruct(age: 2, lowerBound: 4.3, upperBound: 6),
  PercentileDataStruct(age: 3, lowerBound: 5, upperBound: 6.9),
  PercentileDataStruct(age: 4, lowerBound: 5.5, upperBound: 7.5),
  PercentileDataStruct(age: 5, lowerBound: 5.9, upperBound: 8.1),
  PercentileDataStruct(age: 6, lowerBound: 6.2, upperBound: 8.5),
  PercentileDataStruct(age: 7, lowerBound: 6.5, upperBound: 8.9),
  PercentileDataStruct(age: 8, lowerBound: 6.8, upperBound: 9.3),
  PercentileDataStruct(age: 9, lowerBound: 7, upperBound: 9.6),
  PercentileDataStruct(age: 10, lowerBound: 7.3, upperBound: 9.9),
  PercentileDataStruct(age: 11, lowerBound: 7.5, upperBound: 10.2),
  PercentileDataStruct(age: 12, lowerBound: 7.7, upperBound: 10.5),
];

final List<PercentileDataStruct> percentileDataWeightGirls25_75 = [
  PercentileDataStruct(age: 0, lowerBound: 2.9, upperBound: 3.6),
  PercentileDataStruct(age: 1, lowerBound: 3.8, upperBound: 4.6),
  PercentileDataStruct(age: 2, lowerBound: 4.7, upperBound: 5.6),
  PercentileDataStruct(age: 3, lowerBound: 5.4, upperBound: 6.4),
  PercentileDataStruct(age: 4, lowerBound: 5.9, upperBound: 7),
  PercentileDataStruct(age: 5, lowerBound: 6.4, upperBound: 7.5),
  PercentileDataStruct(age: 6, lowerBound: 6.7, upperBound: 7.9),
  PercentileDataStruct(age: 7, lowerBound: 7, upperBound: 8.3),
  PercentileDataStruct(age: 8, lowerBound: 7.3, upperBound: 8.6),
  PercentileDataStruct(age: 9, lowerBound: 7.6, upperBound: 8.9),
  PercentileDataStruct(age: 10, lowerBound: 7.8, upperBound: 9.2),
  PercentileDataStruct(age: 11, lowerBound: 8, upperBound: 9.5),
  PercentileDataStruct(age: 12, lowerBound: 8.2, upperBound: 9.7),
];

final List<PercentileDataStruct> percentileDataHeightGirls1_99 = [
  PercentileDataStruct(age: 0, lowerBound: 44.8, upperBound: 53.5),
  PercentileDataStruct(age: 1, lowerBound: 49.1, upperBound: 58.2),
  PercentileDataStruct(age: 2, lowerBound: 52.3, upperBound: 61.8),
  PercentileDataStruct(age: 3, lowerBound: 54.9, upperBound: 64.7),
  PercentileDataStruct(age: 4, lowerBound: 57.1, upperBound: 67.1),
  PercentileDataStruct(age: 5, lowerBound: 58.9, upperBound: 69.2),
  PercentileDataStruct(age: 6, lowerBound: 60.5, upperBound: 71),
  PercentileDataStruct(age: 7, lowerBound: 61.9, upperBound: 72.7),
  PercentileDataStruct(age: 8, lowerBound: 63.2, upperBound: 74.3),
  PercentileDataStruct(age: 9, lowerBound: 64.5, upperBound: 75.8),
  PercentileDataStruct(age: 10, lowerBound: 65.7, upperBound: 77.2),
  PercentileDataStruct(age: 11, lowerBound: 66.9, upperBound: 78.6),
  PercentileDataStruct(age: 12, lowerBound: 68, upperBound: 80),
];

final List<PercentileDataStruct> percentileDataHeightGirls5_95 = [
  PercentileDataStruct(age: 0, lowerBound: 46.1, upperBound: 52.2),
  PercentileDataStruct(age: 1, lowerBound: 50.5, upperBound: 56.9),
  PercentileDataStruct(age: 2, lowerBound: 53.7, upperBound: 60.4),
  PercentileDataStruct(age: 3, lowerBound: 56.3, upperBound: 63.3),
  PercentileDataStruct(age: 4, lowerBound: 58.5, upperBound: 65.7),
  PercentileDataStruct(age: 5, lowerBound: 60.4, upperBound: 67.7),
  PercentileDataStruct(age: 6, lowerBound: 62, upperBound: 69.5),
  PercentileDataStruct(age: 7, lowerBound: 63.5, upperBound: 71.1),
  PercentileDataStruct(age: 8, lowerBound: 64.9, upperBound: 72.6),
  PercentileDataStruct(age: 9, lowerBound: 66.2, upperBound: 74.1),
  PercentileDataStruct(age: 10, lowerBound: 67.4, upperBound: 75.5),
  PercentileDataStruct(age: 11, lowerBound: 68.6, upperBound: 76.9),
  PercentileDataStruct(age: 12, lowerBound: 69.8, upperBound: 78.3),
];

final List<PercentileDataStruct> percentileDataHeightGirls10_90 = [
  PercentileDataStruct(age: 0, lowerBound: 46.8, upperBound: 51.5),
  PercentileDataStruct(age: 1, lowerBound: 51.2, upperBound: 56.2),
  PercentileDataStruct(age: 2, lowerBound: 54.5, upperBound: 59.7),
  PercentileDataStruct(age: 3, lowerBound: 57.1, upperBound: 62.5),
  PercentileDataStruct(age: 4, lowerBound: 59.3, upperBound: 64.9),
  PercentileDataStruct(age: 5, lowerBound: 61.2, upperBound: 66.9),
  PercentileDataStruct(age: 6, lowerBound: 62.8, upperBound: 68.6),
  PercentileDataStruct(age: 7, lowerBound: 64.3, upperBound: 70.3),
  PercentileDataStruct(age: 8, lowerBound: 65.7, upperBound: 71.8),
  PercentileDataStruct(age: 9, lowerBound: 67, upperBound: 73.2),
  PercentileDataStruct(age: 10, lowerBound: 68.3, upperBound: 74.6),
  PercentileDataStruct(age: 11, lowerBound: 69.5, upperBound: 76),
  PercentileDataStruct(age: 12, lowerBound: 70.7, upperBound: 77.3),
];

final List<PercentileDataStruct> percentileDataHeightGirls25_75 = [
  PercentileDataStruct(age: 0, lowerBound: 47.9, upperBound: 50.4),
  PercentileDataStruct(age: 1, lowerBound: 52.4, upperBound: 55),
  PercentileDataStruct(age: 2, lowerBound: 55.7, upperBound: 58.4),
  PercentileDataStruct(age: 3, lowerBound: 58.4, upperBound: 61.2),
  PercentileDataStruct(age: 4, lowerBound: 60.6, upperBound: 63.5),
  PercentileDataStruct(age: 5, lowerBound: 62.5, upperBound: 65.5),
  PercentileDataStruct(age: 6, lowerBound: 64.2, upperBound: 67.3),
  PercentileDataStruct(age: 7, lowerBound: 65.7, upperBound: 68.8),
  PercentileDataStruct(age: 8, lowerBound: 67.2, upperBound: 70.3),
  PercentileDataStruct(age: 9, lowerBound: 68.5, upperBound: 71.8),
  PercentileDataStruct(age: 10, lowerBound: 69.8, upperBound: 73.1),
  PercentileDataStruct(age: 11, lowerBound: 71.1, upperBound: 74.5),
  PercentileDataStruct(age: 12, lowerBound: 72.3, upperBound: 75.8),
];
