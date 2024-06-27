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

import '/contractions/start_timer/start_timer_widget.dart';
import '/contractions/stop_timer/stop_timer_widget.dart';
import '/contractions/contraction_item/contraction_item_widget.dart';
import 'dart:convert';

class ContractionTimer extends StatefulWidget {
  const ContractionTimer({
    super.key,
    this.width,
    this.height,
    required this.authRef,
  });

  final double? width;
  final double? height;
  final String authRef;
  @override
  State<ContractionTimer> createState() => _ContractionTimerState();
}

class ContractionData {
  final DateTime startTime;
  final Duration duration;
  final Duration? interval;

  ContractionData(this.startTime, this.duration, this.interval);

  // Add a getter for endTime
  DateTime get endTime => startTime.add(duration);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startTime': startTime.millisecondsSinceEpoch,
      'duration': duration.inMilliseconds,
      'interval': interval?.inMilliseconds,
    };
  }

  factory ContractionData.fromMap(Map<String, dynamic> map) {
    return ContractionData(
      DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int),
      Duration(milliseconds: map['duration']),
      map['interval'] != null ? Duration(milliseconds: map['interval']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractionData.fromJson(String source) =>
      ContractionData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ContractionData(startTime: $startTime, duration: $duration, interval: $interval)';

  @override
  bool operator ==(covariant ContractionData other) {
    if (identical(this, other)) return true;

    return other.startTime == startTime &&
        other.duration == duration &&
        other.interval == interval;
  }

  @override
  int get hashCode =>
      startTime.hashCode ^ duration.hashCode ^ interval.hashCode;
}

class ContractionStatistics {
  final int contractionsInHour;
  final String averageDuration;
  final String averageInterval;

  const ContractionStatistics(
      this.contractionsInHour, this.averageDuration, this.averageInterval);
}

class _ContractionTimerState extends State<ContractionTimer> {
  bool isContractionOngoing = false;
  DateTime? contractionStartTime;
  List<ContractionData> contractionList = [];
  ContractionStatistics contractionsStatistics =
      ContractionStatistics(0, '0', '0');

  Future<void> initContractions() async {
    final contractionsDocs = await FirebaseFirestore.instance
        .collection('users') // Users collection
        .doc(widget.authRef)
        .collection('contractions') // Subcollection within user document
        .get(); // Get all documents

    setState(() {
      contractionList = contractionsDocs.docs
          .map((contractionDoc) =>
              ContractionData.fromMap(contractionDoc.data()))
          .toList();
      contractionList.sort(((a, b) => a.startTime.compareTo(b.startTime)));
      contractionsStatistics = calculateContractionStatistics(contractionList);

      FFAppState().update(() {
        FFAppState().contractionStatistics = ContractrionStatisticsStruct(
          qtyPerHour: contractionsStatistics.contractionsInHour,
          avgDuration: contractionsStatistics.averageDuration,
          avgInterval: contractionsStatistics.averageInterval,
        );
      });
    });
  }

  Future<dynamic> deleteContractions() async {
    final contractionRef = await FirebaseFirestore.instance
        .collection('users') // Users collection
        .doc(widget.authRef)
        .collection('contractions');

    // Delete documents in subcollection (batching can be used for efficiency)
    final querySnapshot = await contractionRef.get();
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    setState(() {
      contractionList.clear();
      contractionsStatistics = calculateContractionStatistics(contractionList);

      FFAppState().update(() {
        FFAppState().contractionStatistics = ContractrionStatisticsStruct(
          qtyPerHour: contractionsStatistics.contractionsInHour,
          avgDuration: contractionsStatistics.averageDuration,
          avgInterval: contractionsStatistics.averageInterval,
        );
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initContractions();

    super.initState();
  }

  void startContractionTimer() {
    if (!isContractionOngoing) {
      setState(() {
        isContractionOngoing = true;
        contractionStartTime = DateTime.now();
      });
    }
  }

  void stopContractionTimer() async {
    if (isContractionOngoing) {
      final duration = DateTime.now().difference(contractionStartTime!);
      Duration? interval;
      if (contractionList.isNotEmpty) {
        interval =
            contractionStartTime!.difference(contractionList.last.endTime);
      }
      final contractionData =
          ContractionData(contractionStartTime!, duration, interval);
      setState(() {
        isContractionOngoing = false;
        contractionList.add(contractionData);
        contractionsStatistics =
            calculateContractionStatistics(contractionList);

        FFAppState().update(() {
          FFAppState().contractionStatistics = ContractrionStatisticsStruct(
            qtyPerHour: contractionsStatistics.contractionsInHour,
            avgDuration: contractionsStatistics.averageDuration,
            avgInterval: contractionsStatistics.averageInterval,
          );
        });
      });

      // Add data to Firestore (assuming proper authentication)
      await FirebaseFirestore.instance
          .collection('users') // Users collection
          .doc(widget.authRef) // Specific user document
          .collection('contractions') // Subcollection within user document
          .add(contractionData.toMap());
    }
  }

  ContractionStatistics calculateContractionStatistics(
      List<ContractionData> contractionList) {
    if (contractionList.isEmpty) {
      return ContractionStatistics(0, '0', '0');
    }

    final now = DateTime.now();
    final oneHourAgo = now.subtract(const Duration(hours: 1));

    final contractionsInHour = contractionList
        .where((contraction) =>
            contraction.startTime.isAfter(oneHourAgo) &&
            contraction.startTime.isBefore(now))
        .length;

    final totalDuration = contractionList.fold(
        Duration.zero,
        (sum, contraction) =>
            sum + contraction.duration); // Avoid null checks with '!'

    final averageDuration = totalDuration.inSeconds / contractionList.length;

    final nonZeroIntervals = contractionList
        .where((contraction) => contraction.interval != null)
        .map((contraction) => contraction.interval!)
        .toList();

    final int averageInterval = nonZeroIntervals.isNotEmpty
        ? nonZeroIntervals.reduce((a, b) => a + b).inSeconds ~/
            nonZeroIntervals.length
        : 0;

    final avgDuration =
        formatDuration(Duration(seconds: averageDuration.toInt()));
    final avgInterval = formatDuration(Duration(seconds: averageInterval));

    return ContractionStatistics(contractionsInHour, avgDuration, avgInterval);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        Expanded(
          child: Container(
            width: double.infinity,
            child: ListView.builder(
              itemCount: contractionList.length,
              reverse: true,
              itemBuilder: (context, index) {
                final contraction = contractionList[index];
                return ContractionItemWidget(
                  strartDate: formatTime(contraction.startTime),
                  duration: formatDuration(contraction.duration),
                  index: (index + 1).toString(),
                  interval: formatDuration(contraction.interval ?? Duration()),
                  isFirst: index == 0,
                );
              },
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: 25,
                top: 50,
                child: GestureDetector(
                  onTap: deleteContractions,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(246, 241, 255, 1),
                    ),
                    width: 40,
                    height: 40,
                    child: Image.network(
                      width: 20,
                      height: 20,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/midwife-mentor-2x4x5k/assets/ef8gby2r1rwe/reset.png',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: isContractionOngoing
                    ? Container(
                        alignment: Alignment.bottomCenter,
                        child: StopTimerWidget())
                    : Container(
                        alignment: Alignment.bottomCenter,
                        child: StartTimerWidget()),
                onTap: isContractionOngoing
                    ? stopContractionTimer
                    : startContractionTimer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String formatDuration(Duration duration) {
  final minutes = twoDigits(duration.inMinutes);
  final remainingSeconds =
      duration.inSeconds.remainder(60); // Get seconds within a minute
  final seconds = twoDigits(remainingSeconds);
  return "$minutes:$seconds";
}

String twoDigits(int n) =>
    n >= 10 ? "$n" : "0$n"; // Function to pad numbers with leading zero

formatTime(DateTime dateTime) {
  final hours = twoDigits(dateTime.hour);
  final minutes = twoDigits(dateTime.minute);
  return "$hours:$minutes";
}
