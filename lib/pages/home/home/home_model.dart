import '/components/e_u_rss_feed_display_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for EURssFeedDisplay component.
  late EURssFeedDisplayModel eURssFeedDisplayModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eURssFeedDisplayModel = createModel(context, () => EURssFeedDisplayModel());
  }

  void dispose() {
    unfocusNode.dispose();
    eURssFeedDisplayModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}