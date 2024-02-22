// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getNovaGroupMarkerString(
    List<NovaGroupMarkerStruct> markers) async {
  var res = "";
  for (var marker in markers) {
    res += "Category $marker -> \n";
    for (var value in marker.values) {
      res += "${value.name}: ";
      res += value.values
          .map((e) {
            return "$e, ";
          })
          .toString()
          .trim();
    }
  }
  return res;
}
