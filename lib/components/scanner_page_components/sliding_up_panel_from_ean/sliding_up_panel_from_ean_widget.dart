import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sliding_up_panel_from_ean_model.dart';
export 'sliding_up_panel_from_ean_model.dart';

class SlidingUpPanelFromEanWidget extends StatefulWidget {
  const SlidingUpPanelFromEanWidget({
    Key? key,
    required this.food,
    required this.isOpened,
  }) : super(key: key);

  final ScannedFoodStruct? food;
  final bool? isOpened;

  @override
  _SlidingUpPanelFromEanWidgetState createState() =>
      _SlidingUpPanelFromEanWidgetState();
}

class _SlidingUpPanelFromEanWidgetState
    extends State<SlidingUpPanelFromEanWidget> {
  late SlidingUpPanelFromEanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SlidingUpPanelFromEanModel());
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
        color: Color(0xFF1C0D26),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Stack(
        children: [
          if (widget.isOpened == true)
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.food?.name,
                              'Don\'t have name :(',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFF7F7F7),
                                  fontSize: 32.0,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.food?.producer,
                              'No nu3socre',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFAFACC7),
                                  fontSize: 18.0,
                                  letterSpacing: 0.15,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          if (widget.isOpened == false)
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.food?.name,
                              'Don\'t have name :(',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFF7F7F7),
                                  fontSize: 32.0,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.food?.producer,
                              'No nu3socre',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFFAFACC7),
                                  fontSize: 18.0,
                                  letterSpacing: 0.15,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 70.0)),
            ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.9),
            child: Container(
              width: double.infinity,
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget.isOpened == false)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.8),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Potiahni pre viac informácií',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 12.64,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.9),
                    child: Container(
                      width: 66.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFB7C1FA),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
