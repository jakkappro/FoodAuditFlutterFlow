import '/backend/backend.dart';
import '/components/component_heading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medication_model.dart';
export 'medication_model.dart';

class MedicationWidget extends StatefulWidget {
  const MedicationWidget({
    Key? key,
    required this.whereToScroll,
    required this.shouldShowLink,
  }) : super(key: key);

  final Future<dynamic> Function()? whereToScroll;
  final bool? shouldShowLink;

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
    _model.textFieldFocusNode ??= FocusNode();
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wrapWithModel(
          model: _model.componentHeadingModel1,
          updateCallback: () => setState(() {}),
          child: ComponentHeadingWidget(
            title: FFLocalizations.of(context).getText(
              'up263ymt' /* Medication */,
            ),
            description: FFLocalizations.of(context).getText(
              'c9rll9cf' /* Which medication you do use? */,
            ),
            spacing: 4,
            titleSize: 20,
            descriptionSize: 16,
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Visibility(
            visible: FFAppState().Medication.length != 0,
            child: Builder(
              builder: (context) {
                final medication = FFAppState().Medication.toList();
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 12.0,
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
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 10.0, 12.0, 10.0),
                          child: Text(
                            medicationItem,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
        ),
        Container(
          width: double.infinity,
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 2000),
              () async {
                if (_model.textController.text.length > 1) {
                  setState(() {
                    _model.shouldShowSearch = true;
                  });
                  await widget.whereToScroll?.call();
                  safeSetState(() => _model.algoliaSearchResults = null);
                  await MedicationRecord.search(
                    term: _model.textController.text,
                    maxResults: 3,
                  )
                      .then((r) => _model.algoliaSearchResults = r)
                      .onError((_, __) => _model.algoliaSearchResults = [])
                      .whenComplete(() => setState(() {}));
                } else {
                  setState(() {
                    _model.shouldShowSearch = false;
                  });
                }
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
        if (_model.shouldShowSearch)
          Builder(
            builder: (context) {
              if (_model.algoliaSearchResults == null) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final medicament = (_model.algoliaSearchResults?.toList() ?? [])
                  .take(3)
                  .toList();
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
                        if (!FFAppState()
                            .Medication
                            .contains(medicamentItem.name)) {
                          setState(() {
                            FFAppState().addToMedication(medicamentItem.name);
                          });
                        }
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFFAFACC7),
                                  letterSpacing: 0.15,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ),
                    );
                  }).divide(SizedBox(width: 8.0)),
                ),
              );
            },
          ),
        if (widget.shouldShowLink ?? true)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.componentHeadingModel2,
                  updateCallback: () => setState(() {}),
                  child: ComponentHeadingWidget(
                    title: FFLocalizations.of(context).getText(
                      'ugf1tiv5' /* eSKadra form */,
                    ),
                    description: FFLocalizations.of(context).getText(
                      '9qhqrx6g' /* Form for REPORTING A SUSPECTED... */,
                    ),
                    spacing: 4,
                    titleSize: 20,
                    descriptionSize: 16,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await launchURL('https://portal.sukl.sk/eskadra/');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 10.0, 12.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'v93oi4a3' /* Report it here */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF382F73),
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
      ].divide(SizedBox(height: 15.0)).addToStart(SizedBox(height: 15.0)),
    );
  }
}
