import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'intolerancies_model.dart';
export 'intolerancies_model.dart';

class IntoleranciesWidget extends StatefulWidget {
  const IntoleranciesWidget({Key? key}) : super(key: key);

  @override
  _IntoleranciesWidgetState createState() => _IntoleranciesWidgetState();
}

class _IntoleranciesWidgetState extends State<IntoleranciesWidget> {
  late IntoleranciesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntoleranciesModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 24.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 220.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'x8bene62' /* My preferences */,
              ),
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    fontFamily: 'Lato',
                    color: Color(0xFF1C0D26),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 8.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '2h01pai8' /* Intolerances */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF7A7A7A),
                      fontSize: 16.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FlutterFlowChoiceChips(
                options: [
                  ChipData(FFLocalizations.of(context).getText(
                    'wk3wjgs4' /* Milk */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'p2mshd0m' /* Eggs */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    '3jo6ppbt' /* Peanuts */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'l9fty51k' /* Soy */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    't9nu3dx8' /* Sesame */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    '56yvj6gf' /* Fish */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    '70ryefpb' /* Shellfish */,
                  )),
                  ChipData(FFLocalizations.of(context).getText(
                    'snee8f0w' /* Wheat */,
                  ))
                ],
                onChanged: (val) async {
                  setState(() => _model.choiceChipsValues = val);
                  _model.updatePage(() {
                    FFAppState().updateUserStruct(
                      (e) =>
                          e..intolerancies = _model.choiceChipsValues!.toList(),
                    );
                  });
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFF4B64F2),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFFF7F7F7),
                        fontWeight: FontWeight.w800,
                      ),
                  iconColor: Color(0x00000000),
                  iconSize: 18.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: Colors.transparent,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF7A7A7A),
                        fontWeight: FontWeight.w800,
                      ),
                  iconColor: Color(0xFF7A7A7A),
                  iconSize: 18.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                  elevation: 0.0,
                  borderColor: Color(0xFF7A7A7A),
                  borderWidth: 1.3,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                chipSpacing: 15.0,
                rowSpacing: 12.0,
                multiselect: true,
                initialized: _model.choiceChipsValues != null,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  FFAppState().User.intolerancies,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
