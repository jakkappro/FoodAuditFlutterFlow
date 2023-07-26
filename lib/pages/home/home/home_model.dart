import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/open_scanner_button/open_scanner_button_widget.dart';
import '/components/scanned_items/scanned_items_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;

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

    listViewPagingController1?.dispose();

    openScannerButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
