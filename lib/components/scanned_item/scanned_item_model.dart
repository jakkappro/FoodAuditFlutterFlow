import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class ScannedItemModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool loadedEan = false;

  ScannedFoodStruct? food;
  void updateFoodStruct(Function(ScannedFoodStruct) updateFn) =>
      updateFn(food ??= ScannedFoodStruct());

  bool isFoodSafe = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getFoodFromEAN] action in ScannedItem widget.
  ScannedFoodStruct? newFood;
  // Stores action output result for [Custom Action - isFoodSafe] action in ScannedItem widget.
  bool? foodSafe;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
