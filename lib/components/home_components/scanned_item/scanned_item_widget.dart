import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'scanned_item_model.dart';
export 'scanned_item_model.dart';

class ScannedItemWidget extends StatefulWidget {
  const ScannedItemWidget({
    Key? key,
    required this.scannedItem,
  }) : super(key: key);

  final ScannedItemStruct? scannedItem;

  @override
  _ScannedItemWidgetState createState() => _ScannedItemWidgetState();
}

class _ScannedItemWidgetState extends State<ScannedItemWidget> {
  late ScannedItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.newFood = await actions.getFoodFromEAN(
        widget.scannedItem!.ean,
        false,
      );
      _model.foodSafe = await actions.isFoodSafe(
        _model.newFood?.allergens?.toList(),
      );
      setState(() {
        _model.loadedEan = true;
        _model.isFoodSafe = _model.foodSafe!;
        _model.food = _model.newFood;
      });
    });
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
      width: 225.0,
      height: 229.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Builder(
        builder: (context) {
          if (_model.loadedEan) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Container(
                                width: 28.0,
                                height: 28.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF382F73),
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Scan.png',
                                      width: 13.0,
                                      height: 13.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'd.M.y, H:mm',
                                  widget.scannedItem?.lastScanned,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'no dateTime found',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 11.0,
                                    letterSpacing: 1.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.food?.name,
                              'Couldn\'t find name',
                            ),
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF382F73),
                                  fontSize: 18.0,
                                  letterSpacing: 0.15,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            (String var1) {
                              return var1.split("|").last;
                            }(_model.newFood!.category),
                            'Mlieko',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF382F73),
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.food?.addressLines?.first,
                            'Couldn\'t find producer',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 12.64,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '01ip2n0c' /* 1,2,3,4 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: Color(0xFF82D680),
                              letterSpacing: 0.15,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      child: custom_widgets.SafetyDot(
                        width: 10.0,
                        height: 10.0,
                        allergens: _model.food!.allergens,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CircularPercentIndicator(
              percent: 0.5,
              radius: 60.0,
              lineWidth: 12.0,
              animation: true,
              progressColor: FlutterFlowTheme.of(context).primary,
              backgroundColor: FlutterFlowTheme.of(context).accent4,
              center: Text(
                FFLocalizations.of(context).getText(
                  'h1rwoyzn' /* 50% */,
                ),
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
            );
          }
        },
      ),
    );
  }
}
