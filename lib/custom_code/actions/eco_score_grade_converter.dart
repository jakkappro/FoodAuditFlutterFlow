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

Future<FFUploadedFile> ecoScoreGradeConverter(String? ecoscoregrade) async {
  String imageName = "Eco-score $ecoscoregrade.png";
  ByteData imageData = await rootBundle.load('assets/$imageName');
  List<int> bytes = imageData.buffer.asUint8List();
  return FFUploadedFile(bytes, imageName);
}
