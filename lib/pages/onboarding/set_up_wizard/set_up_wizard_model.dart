import '/components/avatar_menu_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/personal_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SetUpWizardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for Medication component.
  late MedicationModel medicationModel;
  // Model for AvatarMenu component.
  late AvatarMenuModel avatarMenuModel;
  // Model for PersonalInfo component.
  late PersonalInfoModel personalInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    medicationModel = createModel(context, () => MedicationModel());
    avatarMenuModel = createModel(context, () => AvatarMenuModel());
    personalInfoModel = createModel(context, () => PersonalInfoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    intoleranciesModel.dispose();
    medicationModel.dispose();
    avatarMenuModel.dispose();
    personalInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
