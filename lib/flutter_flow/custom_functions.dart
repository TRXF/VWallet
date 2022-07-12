import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double toInt(String rewards) {
  var b = double.parse(rewards);
  return b;
}

String allCaps(String value) {
  return value?.toUpperCase();
}

double stripeToBalance(String amount) {
  double b = double.parse(amount) / 100;
  return b;
}

String stripeDashboard(String stringId) {
  return "https://dashboard.stripe.com/${stringId}/test/dashboard";
}
