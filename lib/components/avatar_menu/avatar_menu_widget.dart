import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 20.0,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w800,
                  lineHeight: 1.4,
                ),
          ),
          AuthUserStreamWidget(
            builder: (context) => Builder(
              builder: (context) {
                final image = functions
                    .getListOfAvatars(currentUserPhoto)
                    .where((e) => e != null && e != '')
                    .toList();
                return Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: List.generate(image.length, (imageIndex) {
                    final imageItem = image[imageIndex];
                    return Container(
                      width: 47.5,
                      height: 47.5,
                      child: Stack(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'AVATAR_MENU_Container_edsbrnvw_ON_TAP');
                              setState(() {
                                FFAppState().imageName = imageItem;
                              });
                            },
                            child: Container(
                              width: 47.5,
                              height: 47.5,
                              child: custom_widgets.ImageFromString(
                                width: 47.5,
                                height: 47.5,
                                name: imageItem,
                              ),
                            ),
                          ),
                          if (imageItem == FFAppState().imageName)
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Container(
                                width: 18.7,
                                height: 18.7,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/check.svg',
                                      width: 11.06,
                                      height: 17.0,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
