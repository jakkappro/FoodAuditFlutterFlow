import '/backend/backend.dart';
import '/components/nutrition_table_row/nutrition_table_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFF1C0D26),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
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
                      width: 200.0,
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
                                Text(
                                  valueOrDefault<String>(
                                    widget.doc?.name,
                                    'No name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFFF7F7F7),
                                        fontSize: 32.0,
                                        letterSpacing: 0.25,
                                        fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Lato',
                                        color: Color(0xFFAFACC7),
                                        fontSize: 18.0,
                                        letterSpacing: 0.15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.doc?.category,
                                    'No category',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFFAFACC7),
                                        fontSize: 18.0,
                                        letterSpacing: 0.15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ].divide(SizedBox(height: 15.0)),
                            ),
                          ),
                          Container(
                            width: 24.0,
                            height: 24.0,
                            child: custom_widgets.SafetyDot(
                              width: 24.0,
                              height: 24.0,
                              allergens: widget.doc!.allergens,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 105.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7kcmujud' /* Nu3Score */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: 105.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pb3y62q9' /* Nova4 */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'z0p07f7g' /* Kliknite pre viac informácií* */,
                        ),
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: Color(0xFFF7F7F7),
                          fontWeight: FontWeight.w600,
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'jk4xh0b8' /* Allergens */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 20.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final allert =
                                      widget.doc?.allergens?.toList() ?? [];
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: allert.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 10.0),
                                    itemBuilder: (context, allertIndex) {
                                      final allertItem = allert[allertIndex];
                                      return Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(
                                            color: Color(0xFFF7F7F7),
                                            width: 1.3,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 10.0, 12.0, 10.0),
                                            child: Text(
                                              allertItem,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: Color(0xFFF7F7F7),
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 220.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ysgynb85' /* Nutrition data */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFFAFACC7),
                                        fontSize: 20.0,
                                        letterSpacing: 0.15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'mettjq8p' /* 100 g */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFFF7F7F7),
                                        letterSpacing: 0.25,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  1.0, 1.0, 1.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 187.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 10.0, 24.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final nutrition =
                                          widget.doc?.nutrients?.toList() ?? [];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            nutrition.length, (nutritionIndex) {
                                          final nutritionItem =
                                              nutrition[nutritionIndex];
                                          return Expanded(
                                            child: NutritionTableRowWidget(
                                              key: Key(
                                                  'Keycb7_${nutritionIndex}_of_${nutrition.length}'),
                                              nutrient: nutritionItem,
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                          Text(
                            valueOrDefault<String>(
                              widget.doc?.name,
                              'No name',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Color(0xFFF7F7F7),
                                  fontSize: 32.0,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.w800,
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
                                  fontFamily: 'Lato',
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 35.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.isOpened == false)
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.8),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6n80je7x' /* Potiahni pre viac informácií */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 12.64,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    Container(
                      width: 66.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFB7C1FA),
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
    );
  }
}
