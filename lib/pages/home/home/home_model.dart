import '/components/header/header_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/notifications/notifications_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for Notifications component.
  late NotificationsModel notificationsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    notificationsModel = createModel(context, () => NotificationsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    intoleranciesModel.dispose();
    notificationsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
