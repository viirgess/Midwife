import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? verifyEmail(String? email) {
  if (email == null || email.isEmpty) {
    return true;
  }
  return email.contains('@') && email.contains('.com');
}

int calculateWeek(
  DateTime calculatedDate,
  DateTime? date,
) {
  // Pregnancy typically lasts 40 weeks (280 days), so we need to find out how many days have passed since conception
  const int totalPregnancyDurationDays = 280;

  // Calculate the first day of the last menstrual period (LMP) by subtracting 280 days from the due date
  DateTime firstDayOfCycle =
      calculatedDate.subtract(Duration(days: totalPregnancyDurationDays));

  date ??= DateTime.now();

  // Calculate the number of days between the first day of the last menstrual period and the current date
  int daysSinceFirstDayOfCycle = date.difference(firstDayOfCycle).inDays;

  // Calculate the current week of pregnancy
  int currentWeekOfPregnancy = (daysSinceFirstDayOfCycle / 7).floor();

  // debugPrint(currentWeekOfPregnancy.toString());
  return currentWeekOfPregnancy;
  // if (calculatedDate == null) {
  //   return 1;
  // }

  // DateTime now = DateTime.now();

  // DateTime conceptionDate = calculatedDate.subtract(Duration(days: 294));

  // if (now.isBefore(conceptionDate)) {
  //   return 0;
  // }
  // int weeksSinceConception = now.difference(conceptionDate).inDays ~/ 7;
  // return weeksSinceConception > 42 ? 42 : weeksSinceConception;
}

String? calculateDay(DateTime? date) {
  if (date == null) {
    return null;
  }

  DateTime now = DateTime.now();
  DateTime birthDate = DateTime(date.year + 1, date.month, date.day);
  Duration difference = birthDate.difference(now);
  int days = difference.inDays;
  return days.toString();
}

String truncateMiddle(String text) {
  if (text.length <= 11) return text; // String is too short, return it as is
  return text.substring(0, 6) + "..." + text.substring(text.length - 5);
}

String getNameFromEmail(String email) {
  int atIndex = email.indexOf('@');
  if (atIndex == -1) {
    return "Anonymous"; // Return empty string if no "@" found
  }
  return email.substring(0, atIndex);
}

int increment(int num) {
  return ++num;
}

int? stringToInteger(String? number) {
  // convert string to integer
  if (number == null) {
    return null;
  }
  try {
    return int.parse(number);
  } catch (e) {
    return null;
  }
}

DateTime? calculateMinDateTime(DateTime now) {
  return now.subtract(Duration(days: 10 * 30));
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  return json.decode('{"role": "user", "content": "$prompt"}');
}

int decrement(int num) {
  return --num;
}

double numberToPercentage(int number) {
  if (number < 0 || number > 30) {
    return 0;
  }

  // Calculate the percentage as a double value (0.0 to 1.0)
  final double percentage = number / 30.0;

  return double.parse(percentage.toStringAsPrecision(2));
}

List<String>? mixTwoLists(
  List<String>? girls,
  List<String>? boys,
) {
  // mix values of two list
  if (girls == null || boys == null) {
    return null;
  }
  final mixedList = <String>[];
  final maxLength = math.max(girls.length, boys.length);
  for (var i = 0; i < maxLength; i++) {
    if (i < girls.length) {
      mixedList.add(girls[i]);
    }
    if (i < boys.length) {
      mixedList.add(boys[i]);
    }
  }

  return mixedList;
}

List<FeedingJournalStruct> createFeeingJournal(
  List<BreastFeedingStruct> listOfBreastFeedings,
  List<PumpFeedinStruct> listOfPumps,
  List<BottleFeedingStruct> listOfBottleFeedings,
) {
  DateTime dateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  Map<DateTime, FeedingJournalStruct> combinedMap = {};

  // Merge weights into the map
  for (var feeding in listOfBreastFeedings) {
    DateTime date = dateOnly(feeding.startDate!);
    if (!combinedMap.containsKey(date)) {
      combinedMap[date] = FeedingJournalStruct(date: date);
    }
    combinedMap[date]!.totalBreastfeed += feeding.totalDuration;
  }

  // Merge heights into the map
  for (var feeding in listOfPumps) {
    DateTime date = dateOnly(feeding.date!);
    if (!combinedMap.containsKey(date)) {
      combinedMap[date] = FeedingJournalStruct(date: date);
    }
    combinedMap[date]!.totalLiquid += feeding.totalAmount;
  }

  // Merge heights into the map
  for (var feeding in listOfBottleFeedings) {
    DateTime date = dateOnly(feeding.date!);
    if (!combinedMap.containsKey(date)) {
      combinedMap[date] = FeedingJournalStruct(date: date);
    }
    combinedMap[date]!.totalLiquid += feeding.bottleAmount;
  }

  List<FeedingJournalStruct> combinedList = combinedMap.values.toList();
  combinedList.sort((a, b) => a.date!.compareTo(b.date!));

  // Convert the map values to a list
  return combinedList;
}

String? calculateTrimester(DateTime? expectedDate) {
  if (expectedDate == null) {
    return null;
  }

  DateTime currentDate = DateTime.now();

  int daysDifference = expectedDate.difference(currentDate).inDays;

  if (daysDifference > 196) {
    return '1';
  } else if (daysDifference > 140) {
    return '2';
  } else if (daysDifference > 84) {
    return '3';
  } else {
    return '3';
  }
}

int calculateLeftQuestions(int aiRequests) {
  return 30 - aiRequests;
}

String getNextMonthFirstDay(DateTime date) {
  final nextMonth = DateTime(date.year, date.month + 1, 1);
  return "${nextMonth.day}.${nextMonth.month}.${nextMonth.year}";
}

List<PumpFeedinStruct> deletePumpFeedingAtIndex(
  List<PumpFeedinStruct> list,
  int index,
) {
  if (list.length - 1 == index) {
    list.removeLast();
  } else {
    list.removeAt(index);
  }

  return list;
}

List<BottleFeedingStruct> deleteBottleFeedingAtIndex(
  List<BottleFeedingStruct> list,
  int index,
) {
  if (list.length - 1 == index) {
    list.removeLast();
  } else {
    list.removeAt(index);
  }

  return list;
}

List<DiaperTrackerStruct> deleteDiaperChangeAtIndex(
  List<DiaperTrackerStruct> list,
  int index,
) {
  if (list.length - 1 == index) {
    list.removeLast();
  } else {
    list.removeAt(index);
  }

  return list;
}

List<WeightStruct> deleteWeightAtIndexCopy(
  List<WeightStruct> list,
  int index,
) {
  if (list.length - 1 == index) {
    list.removeLast();
  } else {
    list.removeAt(index);
  }

  return list;
}

List<BabyNameStruct> parseBabyNames(
  List<String> boys,
  List<String> girls,
) {
  List<BabyNameStruct> listOfNames = [];
  for (var name in boys) {
    listOfNames.add(
      BabyNameStruct(name: name, sex: 'Boy'),
    );
  }
  for (var name in girls) {
    listOfNames.add(
      BabyNameStruct(name: name, sex: 'Girl'),
    );
  }
  listOfNames.shuffle();

  return listOfNames;
}

List<PumpFeedinStruct> editPumpFeedingAtIndex(
  List<PumpFeedinStruct> list,
  int index,
  DateTime? newDate,
  String? newNotes,
  int? newLeft,
  int? newRight,
) {
  if (newDate != null) list[index].date = newDate;
  if (newNotes != null) list[index].notes = newNotes;
  if (newLeft != 0) list[index].leftAmount = newLeft;
  if (newRight != 0) list[index].rightAmount = newRight;

  list[index].totalAmount = list[index].leftAmount + list[index].rightAmount;
  return list;
}

List<BottleFeedingStruct> editBottleFeedingAtIndex(
  List<BottleFeedingStruct> list,
  int index,
  DateTime? newDate,
  String? newNotes,
  int? newAmount,
  String? newType,
) {
  if (newDate != null) list[index].date = newDate;
  if (newNotes != null) list[index].notes = newNotes;
  if (newAmount != 0) list[index].bottleAmount = newAmount;
  if (newType != null) list[index].type = newType;

  return list;
}

List<DiaperTrackerStruct> editDiaperChangeIndex(
  List<DiaperTrackerStruct> list,
  int index,
  DateTime? newDate,
  String? newNotes,
  int? newWetnessLevel,
  Color? newColor,
  String? newDirtyType,
  Diaper? newType,
) {
  if (newDate != null) list[index].date = newDate;
  if (newNotes != null) list[index].notes = newNotes;
  if (newType != null) list[index].type = newType;
  if (newDirtyType != null) list[index].dirtyType = newDirtyType;
  if (newColor != null) list[index].color = newColor;
  if (newWetnessLevel != 0 && newWetnessLevel != null) {
    list[index].wetnessLevel = newWetnessLevel;
  }

  return list;
}

int? getNumberOfBabyNamesBySex(
  List<BabyNameStruct> list,
  String sex,
) {
  return list.where((e) => e.sex == sex).length;
}

String? widgetStateLog(List<String>? widgetState) {
  return widgetState.toString();
}

int countMutualFriends(
  List<DocumentReference> authUserFriends,
  List<DocumentReference> userFriends,
) {
  // Convert both lists to sets for efficient lookups
  final set1 = authUserFriends.toSet();
  final set2 = userFriends.toSet();

  // Use intersection method to find common elements
  final intersection = set1.intersection(set2);

  // Return the size of the intersection set (count of mutual items)
  return intersection.length;
}

String truncateDetails(String details) {
  if (details.length <= 130) {
    return details;
  }
  // Truncate the string to the desired length
  final truncatedText = details.substring(0, 130);
  // Add ellipsis and "Show more" text
  return '$truncatedText... Show more';
}

String generateTimeStamp(DateTime createdTime) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime inputDate =
      DateTime(createdTime.year, createdTime.month, createdTime.day);

  int differenceInDays = today.difference(inputDate).inDays;

  if (differenceInDays == 0) {
    return 'Today';
  } else if (differenceInDays == 1) {
    return 'Yesterday';
  } else {
    return '${inputDate.year}-${inputDate.month.toString().padLeft(2, '0')}-${inputDate.day.toString().padLeft(2, '0')}';
  }
}

List<String> reverseList(List<String> list) {
  return list.reversed.toList();
}

String calculateDistanceBetweenUsers(
  LatLng loc1,
  LatLng loc2,
) {
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180.0;
  }

  double calculateDistance(LatLng loc1, LatLng loc2) {
    const earthRadiusKm = 6371.0;

    final lat1Rad = _degreesToRadians(loc1.latitude);
    final lon1Rad = _degreesToRadians(loc1.longitude);
    final lat2Rad = _degreesToRadians(loc2.latitude);
    final lon2Rad = _degreesToRadians(loc2.longitude);

    final deltaLat = lat2Rad - lat1Rad;
    final deltaLon = lon2Rad - lon1Rad;

    final a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
        math.cos(lat1Rad) *
            math.cos(lat2Rad) *
            math.sin(deltaLon / 2) *
            math.sin(deltaLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    final distanceKm = earthRadiusKm * c;
    return distanceKm;
  }

  String formatDistance(double distanceKm) {
    if (distanceKm < 1) {
      final distanceMeters = (distanceKm * 1000).roundToDouble();
      final roundedMeters = (distanceMeters / 50).roundToDouble() * 50;
      return '${roundedMeters.toStringAsFixed(0)} m';
    } else {
      return '${distanceKm.toStringAsFixed(1)} km';
    }
  }

  String getFormattedDistance(LatLng loc1, LatLng loc2) {
    final distanceKm = calculateDistance(loc1, loc2);
    return formatDistance(distanceKm);
  }

  return getFormattedDistance(loc1, loc2);
}

DateTime calculateEstimatedDeliveryDate(
  DateTime firstDayOfMenstruation,
  int cycleDuration,
) {
  // Average ovulation occurs 14 days before expected period.
  final ovulationOffset = const Duration(days: 14);

  // Adjust for user's cycle duration to estimate ovulation date.
  final ovulationDate =
      firstDayOfMenstruation.add(Duration(days: cycleDuration - 14));

  // Pregnancy typically lasts 280 days (40 weeks) from conception.
  final daysToDueDate = 280;
  final dueDate = ovulationDate.add(Duration(days: daysToDueDate));

  return dueDate;
}

String formatDate(DateTime date) {
  final month = DateFormat('MMMM').format(date); // Get month name
  final day = date.day.toString(); // Get day as string
  final year = date.year.toString(); // Get year as string

  return '$month $day, $year'; // Combine formatted parts
}

List<WeightStruct> editWeightAtIndex(
  List<WeightStruct> list,
  int index,
  double newWeight,
) {
  list[index].weight = newWeight;
  if (list[index].hasDifferenceWithPrevious()) {
    list[index].differenceWithPrevious = double.parse(
        (list[index].weight - list[index - 1].weight).toStringAsFixed(1));
  }

  return list;
}

List<BreastFeedingStruct> deleteBreastFeedingAtIndex(
  List<BreastFeedingStruct> list,
  int index,
) {
  if (list.length - 1 == index) {
    list.removeLast();
  } else {
    list.removeAt(index);
  }

  return list;
}

DateTime estimateConceptionDay(DateTime dueDate) {
// Average pregnancy duration is 280 days (40 weeks).
  final daysToConception = 280;

  // Consider a midpoint of sperm survival time.
  final spermSurvivalDays = 3; // Adjustable based on desired estimate

  // Ovulation typically occurs 14 days before the expected period (adjustable).
  final ovulationOffsetDays = 14;

  // Calculate the estimated date of conception.
  final conceptionDate = dueDate.subtract(Duration(days: daysToConception));

  // Estimate the first day of conception window (midpoint of sperm survival).
  final estimatedConceptionDate = conceptionDate.subtract(
      Duration(days: (ovulationOffsetDays + spermSurvivalDays / 2).floor()));

  return estimatedConceptionDate;
}

double calculateBabyAge(
  DateTime birthDate,
  DateTime date,
) {
  int yearsDifference = date.year - birthDate.year;
  int monthsDifference = date.month - birthDate.month;
  int daysDifference = date.day - birthDate.day;

  int totalMonths = (yearsDifference * 12) + monthsDifference;

  // Calculate the number of days in the birth month
  int daysInBirthMonth = daysInMonth(birthDate.year, birthDate.month);

  // Calculate the fractional part of the month
  double fractionalMonth = daysDifference / daysInBirthMonth;

  // Adjust if the day of birth is greater than the current day of the month
  if (daysDifference < 0) {
    totalMonths -= 1;
    fractionalMonth = (daysDifference + daysInMonth(date.year, date.month)) /
        daysInBirthMonth;
  }

  return totalMonths + fractionalMonth;
}

int calculateBabyWeek(
  DateTime dateOfBirth,
  DateTime date,
) {
  // Calculate the difference in days between the current date and the date of birth
  Duration difference = date.difference(dateOfBirth);

  // Convert the difference in days to weeks
  int ageInWeeks = (difference.inDays / 7).floor();

  return ageInWeeks;
}

List<BabyGrowthStruct> createJournal(
  List<BabyWeigthStruct> listOfWeights,
  List<BabyHeightStruct> listOfHeights,
) {
  DateTime dateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  Map<DateTime, BabyGrowthStruct> combinedMap = {};

  // Merge weights into the map
  for (var weight in listOfWeights) {
    DateTime date = dateOnly(weight.date!);
    if (!combinedMap.containsKey(date)) {
      combinedMap[date] = BabyGrowthStruct(date: date);
    }
    combinedMap[date]!.weight = weight.weight;
  }

  // Merge heights into the map
  for (var height in listOfHeights) {
    DateTime date = dateOnly(height.date!);
    if (!combinedMap.containsKey(date)) {
      combinedMap[date] = BabyGrowthStruct(date: date);
    }
    combinedMap[date]!.height = height.height;
  }

  List<BabyGrowthStruct> combinedList = combinedMap.values.toList();
  combinedList.sort((a, b) => a.date!.compareTo(b.date!));

  // Convert the map values to a list
  return combinedList;
}

String convertMs(int ms) {
  int totalSeconds = ms ~/ 1000; // Convert milliseconds to total seconds
  int minutes = totalSeconds ~/ 60; // Calculate total minutes
  int seconds = totalSeconds % 60; // Calculate remaining seconds

  // Format minutes and seconds with leading zero if necessary
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');

  return "$minutesStr:$secondsStr";
}

int newCustomFunction(
  int year,
  int month,
) {
  return DateTime(year, month + 1, 0).day;
}

int daysInMonth(
  int year,
  int month,
) {
  if (month == DateTime.april ||
      month == DateTime.june ||
      month == DateTime.september ||
      month == DateTime.november) {
    return 30;
  } else {
    return 31;
  }
}

List<BreastFeedingStruct> editBreastFeedingAtIndex(
  List<BreastFeedingStruct> list,
  int index,
  DateTime? newDate,
  bool? newFirstBreast,
  int? newLeftDuration,
  int? newRightDuration,
  String? newNotes,
) {
  if (newDate != null) list[index].startDate = newDate;

  if (newFirstBreast != null) list[index].firstBreast = newFirstBreast;
  if (newLeftDuration != 0) list[index].leftDuration = newLeftDuration;
  if (newRightDuration != 0) list[index].rightDuration = newRightDuration;
  if (newNotes != null) list[index].notes = newNotes;

  list[index].totalDuration =
      list[index].leftDuration + list[index].rightDuration;

  return list;
}

int getDaysOfPregnancy(
  DateTime date,
  DateTime calculatedDate,
) {
// Calculate the difference in days between the current date and the start date
  int differenceInDays = date.difference(calculatedDate).inDays;

  // Calculate weeks and remaining days
  int days = differenceInDays % 7;

  // Return the result as a formatted string
  return days;
// '${weeks} week${weeks != 1 ? 's' : ''}, ${days} day${days != 1 ? 's' : ''}';
}

DateTime calculateSubscriptionPeriod(
  DateTime startDate,
  int days,
) {
  return startDate.add(Duration(days: days));
}

String? calculateDateToBabyBirth(DateTime? expectedDate) {
  // calculate amount of day from today to given date
  if (expectedDate == null) {
    return null;
  }
  final now = DateTime.now();
  final difference = expectedDate.difference(now).inDays;
  if (difference < 0) {
    return '0';
  }
  return difference.toString();
}
