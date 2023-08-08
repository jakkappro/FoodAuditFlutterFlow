import '/components/avatar_menu_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/personal_info_widget.dart';
import '/components/scanner_page_components/close_scanner_button/close_scanner_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AvatarMenu component.
  late AvatarMenuModel avatarMenuModel;
  // Model for PersonalInfo component.
  late PersonalInfoModel personalInfoModel;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for Medication component.
  late MedicationModel medicationModel;
  // Model for CloseScannerButton component.
  late CloseScannerButtonModel closeScannerButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    avatarMenuModel = createModel(context, () => AvatarMenuModel());
    personalInfoModel = createModel(context, () => PersonalInfoModel());
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    medicationModel = createModel(context, () => MedicationModel());
    closeScannerButtonModel =
        createModel(context, () => CloseScannerButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    avatarMenuModel.dispose();
    personalInfoModel.dispose();
    intoleranciesModel.dispose();
    medicationModel.dispose();
    closeScannerButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
