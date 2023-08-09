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

class ScannedItemSafetyText extends StatefulWidget {
  const ScannedItemSafetyText({
    Key? key,
    this.width,
    this.height,
    required this.allergens,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> allergens;

  @override
  _ScannedItemSafetyTextState createState() => _ScannedItemSafetyTextState();
}

class _ScannedItemSafetyTextState extends State<ScannedItemSafetyText> {
  Future<bool> getFoodSafety() async {
    final food = await isFoodSafe(widget.allergens);
    return food;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFoodSafety(),
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: Color(0x7a7a7a),
              shape: BoxShape.circle,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text(
            snapshot.data! ? 'Safe for you' : 'Contains alergen',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: snapshot.data!
                      ? FlutterFlowTheme.of(context).success
                      : FlutterFlowTheme.of(context).error,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w800,
                ),
          );
        }
      },
    );
  }
}
