import '/components/header/header_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/open_scanner_button/open_scanner_button_widget.dart';
import '/components/scanned_items/scanned_items_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ScannedItems component.
  late ScannedItemsModel scannedItemsModel;
  // Model for Intolerancies component.
  late IntoleranciesModel intoleranciesModel;
  // Model for OpenScannerButton component.
  late OpenScannerButtonModel openScannerButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    scannedItemsModel = createModel(context, () => ScannedItemsModel());
    intoleranciesModel = createModel(context, () => IntoleranciesModel());
    openScannerButtonModel =
        createModel(context, () => OpenScannerButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    scannedItemsModel.dispose();
    intoleranciesModel.dispose();
    openScannerButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
