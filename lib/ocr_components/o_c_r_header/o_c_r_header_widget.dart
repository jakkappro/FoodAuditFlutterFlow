import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_c_r_header_model.dart';
export 'o_c_r_header_model.dart';

class OCRHeaderWidget extends StatefulWidget {
  const OCRHeaderWidget({
    Key? key,
    required this.currentName,
  }) : super(key: key);

  final String? currentName;

  @override
  _OCRHeaderWidgetState createState() => _OCRHeaderWidgetState();
}

class _OCRHeaderWidgetState extends State<OCRHeaderWidget> {
  late OCRHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OCRHeaderModel());
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
      height: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.80),
        child: Text(
          widget.currentName!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).lNWhite,
                fontSize: 26.0,
              ),
        ),
      ),
    );
  }
}
