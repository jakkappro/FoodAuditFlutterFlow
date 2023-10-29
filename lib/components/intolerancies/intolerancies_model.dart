import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'intolerancies_widget.dart' show IntoleranciesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IntoleranciesModel extends FlutterFlowModel<IntoleranciesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ComponentHeading component.
  late ComponentHeadingModel componentHeadingModel;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentHeadingModel = createModel(context, () => ComponentHeadingModel());
  }

  void dispose() {
    componentHeadingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
