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
              'My preferences',
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
                'Intolerances',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF7A7A7A),
                      fontSize: 16.0,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FlutterFlowChoiceChips(
                options: [
                  ChipData('Milk'),
                  ChipData('Eggs'),
                  ChipData('Peanuts'),
                  ChipData('Soy'),
                  ChipData('Sesame'),
                  ChipData('Fish'),
                  ChipData('Shellfish'),
                  ChipData('Wheat')
                ],
                onChanged: (val) async {
                  setState(() => _model.choiceChipsValues = val);
                  setState(() {
                    FFAppState().updateUserStruct(
                      (e) =>
                          e..intolerancies = _model.choiceChipsValues!.toList(),
                    );
                  });
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: Color(0xFF4B64F2),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
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
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF7A7A7A),
                        fontWeight: FontWeight.w800,
                      ),
                  iconColor: Color(0xFF7A7A7A),
                  iconSize: 18.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                  elevation: 0.0,
                  borderColor: Color(0xFF7A7A7A),
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
