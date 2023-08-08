import '/components/home_components/header/header_widget.dart';
import '/components/home_components/scanned_items/scanned_items_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/scanner_page_components/open_scanner_button/open_scanner_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => setState(() {}),
                        child: HeaderWidget(),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 228.0,
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 28.0, 24.0, 0.0),
                        child: Container(
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          height: 300.0,
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.medicationModel,
                            updateCallback: () => setState(() {}),
                            child: MedicationWidget(),
                          ),
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 90.0)),
                  ),
                ),
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
