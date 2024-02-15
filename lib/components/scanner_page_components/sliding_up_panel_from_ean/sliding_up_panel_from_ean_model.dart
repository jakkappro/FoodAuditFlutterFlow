import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/scanner_detail/nutrition_table_row/nutrition_table_row_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'sliding_up_panel_from_ean_widget.dart' show SlidingUpPanelFromEanWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SlidingUpPanelFromEanModel
    extends FlutterFlowModel<SlidingUpPanelFromEanWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getProductById] action in SlidingUpPanelFromEan widget.
  ProductFromOFFStruct? product;
  // Stores action output result for [Custom Action - nutriscoreGradeConverter] action in SlidingUpPanelFromEan widget.
  FFUploadedFile? nutriScoreImage;
  // Stores action output result for [Custom Action - ecoScoreGradeConverter] action in SlidingUpPanelFromEan widget.
  FFUploadedFile? ecoScoreImage;
  // Stores action output result for [Custom Action - novagroupImageConverter] action in SlidingUpPanelFromEan widget.
  FFUploadedFile? novaImage;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
