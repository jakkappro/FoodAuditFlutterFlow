// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> isFoodSafe(List<String>? foodAllergens) async {
  final usersAlergies = FFAppState().User.intolerancies;

  // could be optimized using some better algorithm but not necessary now
  for (String allergen in usersAlergies) {
    if (foodAllergens!.contains(allergen)) {
      return false;
    }
  }

  return true;
}
