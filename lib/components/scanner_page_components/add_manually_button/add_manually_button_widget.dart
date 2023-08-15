import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_manually_button_model.dart';
export 'add_manually_button_model.dart';

class AddManuallyButtonWidget extends StatefulWidget {
  const AddManuallyButtonWidget({
    Key? key,
    required this.ean,
  }) : super(key: key);

  final String? ean;

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await RequestedEansRecord.collection
            .doc()
            .set(createRequestedEansRecordData(
              ean: widget.ean,
              createdBy: FFAppState().IsGuest ? 'guest' : currentUserUid,
              creationTime: getCurrentTimestamp,
            ));
      },
      child: Container(
        width: 160.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Color(0xFFB7C1FA),
          borderRadius: BorderRadius.circular(76.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '7dl2baci' /* Add manualy */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: Color(0xFF382F73),
                  fontSize: 18.0,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ),
    );
  }
}
