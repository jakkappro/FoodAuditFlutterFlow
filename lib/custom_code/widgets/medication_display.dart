// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MedicationDisplay extends StatefulWidget {
  const MedicationDisplay({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _MedicationDisplayState createState() => _MedicationDisplayState();
}

class _MedicationDisplayState extends State<MedicationDisplay> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final medication = FFAppState().Medication.toList();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(medication.length, (medicationIndex) {
              final medicationItem = medication[medicationIndex];
              return FutureBuilder(builder: (BuildContext context,
                  AsyncSnapshot<MedicationStruct> snapshot) {
                return MedicationContainerWidget(
                  key: Key('Keyylg_${medicationIndex}_of_${medication.length}'),
                );
              });
            }).divide(SizedBox(width: 8.0)),
          ),
        );
      },
    );
  }
}

class MedicationStruct {}
