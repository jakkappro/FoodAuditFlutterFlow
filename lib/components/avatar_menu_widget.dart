import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avatar_menu_model.dart';
export 'avatar_menu_model.dart';

class AvatarMenuWidget extends StatefulWidget {
  const AvatarMenuWidget({Key? key}) : super(key: key);

  @override
  _AvatarMenuWidgetState createState() => _AvatarMenuWidgetState();
}

class _AvatarMenuWidgetState extends State<AvatarMenuWidget> {
  late AvatarMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarMenuModel());
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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'c7ui5zar' /* Choose your avatar */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: Color(0xFF382F73),
                  fontSize: 20.0,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w800,
                  lineHeight: 1.4,
                ),
          ),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    FFAppState().imageName = '1';
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Frame_32.png',
                    width: 47.5,
                    height: 47.5,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    FFAppState().imageName = '2';
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Frame_33.png',
                    width: 47.5,
                    height: 47.5,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  setState(() {
                    FFAppState().imageName = '03';
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Frame_34.png',
                    width: 47.5,
                    height: 47.5,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_35.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_36.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_37.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_38.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_39.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_40_(1).png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_41.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Property_1=Default.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/Frame_46.png',
                  width: 47.5,
                  height: 47.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
