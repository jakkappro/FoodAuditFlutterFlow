import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: AuthUserStreamWidget(
                      builder: (context) => AutoSizeText(
                        '${FFLocalizations.of(context).languageCode == 'en' ? 'Hi ' : 'Ahoj '}${valueOrDefault<String>(
                          currentUserDisplayName,
                          'user',
                        )}!'
                            .maybeHandleOverflow(
                          maxChars: 20,
                          replacement: '…',
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 32.0,
                              letterSpacing: 0.25,
                              fontWeight: FontWeight.w800,
                              lineHeight: 1.3,
                            ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: AutoSizeText(
                      FFLocalizations.of(context).getText(
                        'uy4uktgo' /* Scan your first product. */,
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFAFACC7),
                            fontSize: 18.0,
                            letterSpacing: 0.15,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().IsGuest) {
                  context.pushNamed('Welcome');
                } else {
                  context.pushNamed('Settings');
                }
              },
              child: Container(
                width: 73.0,
                height: 73.0,
                child: custom_widgets.ImageFromString(
                  width: 73.0,
                  height: 73.0,
                  name: FFAppState().imageName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
