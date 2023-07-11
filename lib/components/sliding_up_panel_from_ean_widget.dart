import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sliding_up_panel_from_ean_model.dart';
export 'sliding_up_panel_from_ean_model.dart';

class SlidingUpPanelFromEanWidget extends StatefulWidget {
  const SlidingUpPanelFromEanWidget({
    Key? key,
    required this.food,
  }) : super(key: key);

  final ScannedFoodStruct? food;

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
      width: 100.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Text(
                valueOrDefault<String>(
                  widget.food?.name,
                  'Don\'t have name :(',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Text(
              valueOrDefault<String>(
                functions
                    .ingredientsToString(widget.food?.ingredients?.toList()),
                'No ingredients',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Text(
              valueOrDefault<String>(
                (List<String> ingredientList) {
                  return "Allergens: " + ingredientList.join(", ");
                }(widget.food!.allergens.toList()),
                'No allergens',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Text(
              valueOrDefault<String>(
                widget.food?.nu3Socre,
                'No nu3socre',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Text(
              valueOrDefault<String>(
                widget.food?.nova4,
                'No nova4',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                height: 350.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.NutritionTable(
                    width: double.infinity,
                    height: double.infinity,
                    nutritions: widget.food?.nutritions,
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 15.0)),
        ),
      ),
    );
  }
}
