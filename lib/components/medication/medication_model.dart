import '/backend/backend.dart';
import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MedicationModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  bool shouldShowSearch = false;

  ///  State fields for stateful widgets in this component.

  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel1;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<MedicationRecord>? algoliaSearchResults = [];
  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentHeadingModel1 =
        createModel(context, () => ComponentHeadingModel());
    componentHeadingModel2 =
        createModel(context, () => ComponentHeadingModel());
  }

  void dispose() {
    componentHeadingModel1.dispose();
    textController?.dispose();
    componentHeadingModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
