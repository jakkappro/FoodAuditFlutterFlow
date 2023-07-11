// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ScannedFoodStruct?> getFoodFromEAN(String ean) async {
  // Add your function code here!
  return ScannedFoodStruct(
    ean: ean,
    nu3Socre: "A",
    bin: "Yellow",
    nova4: "unprocessed",
    allergens: ["gluten", "lactose", "nuts", "soy"],
  );
}
