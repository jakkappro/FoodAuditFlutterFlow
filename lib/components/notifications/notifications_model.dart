import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<EURssFeedModelStruct> rssFeed = [];
  void addToRssFeed(EURssFeedModelStruct item) => rssFeed.add(item);
  void removeFromRssFeed(EURssFeedModelStruct item) => rssFeed.remove(item);
  void removeAtIndexFromRssFeed(int index) => rssFeed.removeAt(index);
  void updateRssFeedAtIndex(
          int index, Function(EURssFeedModelStruct) updateFn) =>
      rssFeed[index] = updateFn(rssFeed[index]);

  bool feedLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - parseXml] action in Notifications widget.
  List<EURssFeedModelStruct>? alertList;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
