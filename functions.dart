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
import '/auth/firebase_auth/auth_util.dart';

String? todaysDate() {
  // I want to return todays Day. Like Monday, Tuesday, Wednesday, etc.
  final now = DateTime.now();
  final formatter = DateFormat('EEEE');
  return formatter.format(now);
}

List<DateTime>? calculateDoseTimes(
  String firstDoseTime,
  String interval,
  String dosesPerDay,
) {
  final int inter =
      int.tryParse(interval) ?? 0; // Default to 0 if parsing fails
  final int dosesPD =
      int.tryParse(dosesPerDay) ?? 0; // Default to 0 if parsing fails

  // Parse the first dose time
  final DateTime initialTime = DateTime.parse(firstDoseTime);
  List<DateTime> doseTimes = [];

  for (int i = 0; i < dosesPD; i++) {
    final doseTime = initialTime.add(Duration(hours: inter * i));
    doseTimes.add(doseTime);
  }

  return doseTimes;
}

DateTime? carouselTime(String interval) {
  int intervalMinutes =
      int.tryParse(interval) ?? 0; // Default to 0 if parsing fails

  // Get the current time
  DateTime currentTime = DateTime.now();

  // Add the interval (in minutes) to the current time
  DateTime futureTime =
      currentTime.add(Duration(minutes: intervalMinutes * 60));

  // Return the `DateTime` object
  return futureTime;
}

DateTime? currentDateTime() {
  return DateTime.now().toUtc();
}
