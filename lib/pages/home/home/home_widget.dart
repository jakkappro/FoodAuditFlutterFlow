import '/components/home_components/header/header_widget.dart';
import '/components/home_components/scanned_items/scanned_items_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/scanner_page_components/open_scanner_button/open_scanner_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).lNWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).lNWhite,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: SingleChildScrollView(
                    controller: _model.columnController,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.headerModel,
                          updateCallback: () => setState(() {}),
                          child: HeaderWidget(),
                        ),
                        if (FFAppState().ScannedItems.length != 0)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '01o89ltf' /* Last scanned items */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF382F73),
                                      fontSize: 20.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.w800,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 238.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: wrapWithModel(
                                  model: _model.scannedItemsModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: ScannedItemsWidget(),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: wrapWithModel(
                            model: _model.intoleranciesModel,
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: IntoleranciesWidget(),
                          ),
                        ),
                        if (FFAppState().medicaments)
                          Container(
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.medicationModel,
                              updateCallback: () => setState(() {}),
                              child: MedicationWidget(
                                shouldShowLink: true,
                                whereToScroll: () async {
                                  await _model.columnController?.animateTo(
                                    _model.columnController!.position
                                        .maxScrollExtent,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 28.0))
                          .addToEnd(SizedBox(height: 90.0)),
                    ),
                  ),
                ),
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.openScannerButtonModel,
                      updateCallback: () => setState(() {}),
                      child: OpenScannerButtonWidget(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
