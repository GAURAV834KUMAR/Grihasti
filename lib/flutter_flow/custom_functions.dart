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

bool mrpequalrate(
  double? mrp,
  double? rate,
) {
  if (mrp != rate) {
    return true;
  } else {
    return false;
  }
}

double discount(
  double? rate,
  double? mrp,
) {
  return mrp! - rate!;
}

double subtotal(
  double? rate,
  double? deliverycharges,
) {
  // rate + deliverycharges
  return rate! + deliverycharges!;
}

int defaultcd(
  double? rate,
  double? cd,
) {
  if (cd! > 0) {
    rate = rate! - (rate * cd / 100);
    return rate.round();
  } else
    return rate!.round();
}

bool visibledisc(double? disc) {
  if (disc != 0) {
    return true;
  } else {
    return false;
  }
}

double format(double? vlu) {
  return vlu!;
}

int quantityrate(
  int? rate,
  int? quantity,
) {
  return rate! * quantity!;
}

int noOfItems(int? vlu) {
  return vlu! - 1;
}
