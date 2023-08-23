import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_product_message_model.dart';
export 'scan_product_message_model.dart';

class ScanProductMessageWidget extends StatefulWidget {
  const ScanProductMessageWidget({Key? key}) : super(key: key);

  @override
  _ScanProductMessageWidgetState createState() =>
      _ScanProductMessageWidgetState();
}

class _ScanProductMessageWidgetState extends State<ScanProductMessageWidget> {
  late ScanProductMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanProductMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'cz2154o8' /* Scan your product */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFFD7D5E3),
                    fontSize: 32.0,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.w800,
                    lineHeight: 1.3,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
