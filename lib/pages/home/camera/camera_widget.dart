import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_model.dart';
export 'camera_model.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Camera'});
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
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.terst = await FlutterBarcodeScanner.scanBarcode(
                '#C62828', // scanning line color
                'Cancel', // cancel button text
                true, // whether to show the flash icon
                ScanMode.BARCODE,
              );

              setState(() {});
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  BarcodeWidget(
                    data: 'Barcode',
                    barcode: Barcode.code128(),
                    width: 300.0,
                    height: 90.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                    backgroundColor: Colors.transparent,
                    errorBuilder: (_context, _error) => SizedBox(
                      width: 300.0,
                      height: 90.0,
                    ),
                    drawText: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
