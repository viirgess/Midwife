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
    return null;
  }

  DateTime now = DateTime.now();
  Duration difference = now.difference(calculatedDate);
  int days = difference.inDays;

  int weeks = (days / 7).floor();
  return weeks;
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
