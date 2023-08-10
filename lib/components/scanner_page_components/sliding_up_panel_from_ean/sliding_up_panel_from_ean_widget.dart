import '/backend/backend.dart';
import '/components/scanner_detail/nutrition_table_row/nutrition_table_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sliding_up_panel_from_ean_model.dart';
export 'sliding_up_panel_from_ean_model.dart';

class SlidingUpPanelFromEanWidget extends StatefulWidget {
  const SlidingUpPanelFromEanWidget({
    Key? key,
    required this.isOpened,
    bool? isSafe,
    required this.doc,
  })  : this.isSafe = isSafe ?? false,
        super(key: key);

  final bool? isOpened;
  final bool isSafe;
  final ProductsRecord? doc;

  @override
  _SlidingUpPanelFromEanWidgetState createState() =>
      _SlidingUpPanelFromEanWidgetState();
}

class _SlidingUpPanelFromEanWidgetState
    extends State<SlidingUpPanelFromEanWidget> {
  late SlidingUpPanelFromEanModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SlidingUpPanelFromEanModel());
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
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF7F7F7),
            FlutterFlowTheme.of(context).lNWhite,
            FlutterFlowTheme.of(context).primaryBackground
          ],
          stops: [0.0, 0.5, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 0.0),
        child: Stack(
          children: [
            if (widget.isOpened == true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      widget.doc?.name,
                                      'No name',
                                    ).maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 32.0,
                                          letterSpacing: 0.25,
                                          fontWeight: FontWeight.w800,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget.doc?.addressLines?.first,
                                      'No producer',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFFAFACC7),
                                          fontSize: 18.0,
                                          letterSpacing: 0.15,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  AutoSizeText(
                                    valueOrDefault<String>(
                                      (String var1) {
                                        return var1.split("|").last;
                                      }(widget.doc!.category),
                                      'Milk',
                                    ).maybeHandleOverflow(
                                      maxChars: 25,
                                      replacement: '…',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFFAFACC7),
                                          fontSize: 18.0,
                                          letterSpacing: 0.15,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.55,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 22.0,
                              height: 22.0,
                              child: custom_widgets.SafetyDotStatelessWrapper(
                                width: 22.0,
                                height: 22.0,
                                allergens: widget.doc!.allergens,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 105.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/NSC.png',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'jk4xh0b8' /* Allergens */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            Builder(
                              builder: (context) {
                                final allergen = functions
                                    .getEveryOtherFromList(
                                        widget.doc!.allergens.toList(),
                                        FFLocalizations.of(context)
                                                .languageCode ==
                                            'EN')
                                    .toList();
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(allergen.length,
                                        (allergenIndex) {
                                      final allergenItem =
                                          allergen[allergenIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: functions.listContainsItem(
                                                  allergenItem,
                                                  FFAppState()
                                                      .Allergies
                                                      .toList())
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .success,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 10.0, 12.0, 10.0),
                                          child: Text(
                                            allergenItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: functions
                                                          .listContainsItem(
                                                              allergenItem,
                                                              FFAppState()
                                                                  .Allergies
                                                                  .toList())
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .lNWhite
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  letterSpacing: 0.15,
                                                  fontWeight: FontWeight.w800,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      );
                                    }).divide(SizedBox(width: 8.0)),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                'z861kbv3' /* Medication contraindications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              child: custom_widgets.MedicationDisplay(
                                width: double.infinity,
                                product: widget.doc,
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ysgynb85' /* Nutrition data */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.15,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.55,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'mettjq8p' /* 100 g/100ml */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.15,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.55,
                                        ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final nutrition =
                                        widget.doc?.nutrients?.toList() ?? [];
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(nutrition.length,
                                          (nutritionIndex) {
                                        final nutritionItem =
                                            nutrition[nutritionIndex];
                                        return NutritionTableRowWidget(
                                          key: Key(
                                              'Keycb7_${nutritionIndex}_of_${nutrition.length}'),
                                          nutrient: nutritionItem,
                                        );
                                      }).divide(SizedBox(height: 4.0)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 50.0)),
                  ),
                ),
              ),
            if (widget.isOpened == false)
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 15.0, 24.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget.doc?.name,
                                'No name',
                              ).maybeHandleOverflow(maxChars: 20),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 32.0,
                                    letterSpacing: 0.25,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            AutoSizeText(
                              valueOrDefault<String>(
                                widget.doc?.addressLines?.first,
                                'No producer',
                              ).maybeHandleOverflow(maxChars: 25),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 18.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ),
                ].addToEnd(SizedBox(height: 70.0)),
              ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.isOpened == false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6n80je7x' /* Potiahni pre viac informácií */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF382F73),
                                  fontSize: 12.64,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.7,
                                ),
                          ),
                        ),
                      Container(
                        width: 60.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFAFACC7),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
