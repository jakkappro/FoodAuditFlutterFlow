import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'medication_model.dart';
export 'medication_model.dart';

class MedicationWidget extends StatefulWidget {
  const MedicationWidget({Key? key}) : super(key: key);

  @override
  _MedicationWidgetState createState() => _MedicationWidgetState();
}

class _MedicationWidgetState extends State<MedicationWidget> {
  late MedicationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicationModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            '8ebakrts' /* Medication */,
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
        Text(
          FFLocalizations.of(context).getText(
            'x0l4523o' /* Which medication you use? */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Roboto',
                color: Color(0xFFAFACC7),
                fontSize: 16.0,
                lineHeight: 1.5,
              ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Builder(
            builder: (context) {
              final medication = FFAppState().Medication.toList();
              return Wrap(
                spacing: 12.0,
                runSpacing: 5.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: List.generate(medication.length, (medicationIndex) {
                  final medicationItem = medication[medicationIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        FFAppState().removeFromMedication(medicationItem);
                      });
                    },
                    child: Container(
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 10.0, 12.0, 10.0),
                        child: Text(
                          medicationItem,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFF7F7F7),
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
        Container(
          width: double.infinity,
          child: TextFormField(
            controller: _model.textController,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 2000),
              () async {
                await queryMedicationRecordOnce()
                    .then(
                      (records) => _model.simpleSearchResults = TextSearch(
                        records
                            .map(
                              (record) =>
                                  TextSearchItem(record, [record.name!]),
                            )
                            .toList(),
                      )
                          .search(_model.textController.text)
                          .map((r) => r.object)
                          .take(3)
                          .toList(),
                    )
                    .onError((_, __) => _model.simpleSearchResults = [])
                    .whenComplete(() => setState(() {}));
              },
            ),
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintText: FFLocalizations.of(context).getText(
                'jv8nw803' /* Start typing name of product..... */,
              ),
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Roboto',
                    color: Color(0xFF382F73),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    lineHeight: 1.5,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFAFACC7),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 16.0, 10.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
        Builder(
          builder: (context) {
            final medicament =
                _model.simpleSearchResults.toList().take(3).toList();
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(medicament.length, (medicamentIndex) {
                  final medicamentItem = medicament[medicamentIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      setState(() {
                        FFAppState().addToMedication(medicamentItem.name);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: Color(0xFFAFACC7),
                          width: 1.3,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 10.0, 12.0, 10.0),
                        child: Text(
                          medicamentItem.name,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFAFACC7),
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                    ),
                  );
                }).divide(SizedBox(width: 12.0)),
              ),
            );
          },
        ),
      ]
          .divide(SizedBox(height: 15.0))
          .addToStart(SizedBox(height: 15.0))
          .addToEnd(SizedBox(height: 30.0)),
    );
  }
}
