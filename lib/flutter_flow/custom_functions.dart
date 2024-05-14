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

int? calculateWeek(DateTime? calculatedDate) {
  if (calculatedDate == null) {
    return 1;
  }

  DateTime now = DateTime.now();

  DateTime conceptionDate = calculatedDate.subtract(Duration(days: 294));

  if (now.isBefore(conceptionDate)) {
    return 0;
  }
  int weeksSinceConception = now.difference(conceptionDate).inDays ~/ 7;
  return weeksSinceConception > 42 ? 42 : weeksSinceConception;
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

String truncateText(String text) {
  String suffix = '...';
  int maxLength = 15;

  if (text.length <= maxLength) return text;
  return text.substring(0, maxLength - suffix.length) + suffix;
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

int? getNumberOfBabyNamesBySex(
  List<BabyNameStruct> list,
  String sex,
) {
  return list.where((e) => e.sex == sex).length;
}

String? widgetStateLog(List<String>? widgetState) {
  return widgetState.toString();
}
