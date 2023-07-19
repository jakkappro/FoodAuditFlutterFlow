import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_manually_button_model.dart';
export 'add_manually_button_model.dart';

class AddManuallyButtonWidget extends StatefulWidget {
  const AddManuallyButtonWidget({Key? key}) : super(key: key);

  @override
  _AddManuallyButtonWidgetState createState() =>
      _AddManuallyButtonWidgetState();
}

class _AddManuallyButtonWidgetState extends State<AddManuallyButtonWidget> {
  late AddManuallyButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddManuallyButtonModel());
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
      width: 160.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Color(0xFFB7C1FA),
        borderRadius: BorderRadius.circular(76.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          'Add manualy',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: Color(0xFF382F73),
                fontSize: 18.0,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}
