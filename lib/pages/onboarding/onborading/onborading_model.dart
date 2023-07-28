import '/components/authentication/auth_component/auth_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboradingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for AuthComponent component.
  late AuthComponentModel authComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authComponentModel = createModel(context, () => AuthComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    authComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
