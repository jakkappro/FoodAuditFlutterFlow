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
import '/auth/firebase_auth/auth_util.dart';

String? ingredientsToString(List<IngredientStruct>? ingredients) {
  if (ingredients == null) {
    return null;
  }
  return ingredients
      .map(
        (e) => e.name,
      )
      .join(", ");
}

bool listContainsItem(
  String allergen,
  List<String> allergies,
) {
  return allergies.map((e) => e.toLowerCase()).contains(allergen.toLowerCase());
}

List<String> getEveryOtherFromList(
  List<String> list,
  bool odd,
) {
  // get every odd item from list and then retur the list
  List<String> result = [];
  for (int i = odd ? 1 : 0; i < list.length; i += 2) {
    result.add(list[i]);
  }
  return result;
}

List<String> getListOfAvatars() {
  List<String> result = [];
  for (int i = 111; i <= 122; i++) {
    result.add(i.toString());
  }

  return result;
}
