import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutrition_table_row_model.dart';
export 'nutrition_table_row_model.dart';

class NutritionTableRowWidget extends StatefulWidget {
  const NutritionTableRowWidget({
    Key? key,
    required this.nutrient,
  }) : super(key: key);

  final NutrientStruct? nutrient;

  @override
  _NutritionTableRowWidgetState createState() =>
      _NutritionTableRowWidgetState();
}

class _NutritionTableRowWidgetState extends State<NutritionTableRowWidget> {
  late NutritionTableRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionTableRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.nutrient?.nutrientType}'.maybeHandleOverflow(
            maxChars: 20,
            replacement: '…',
          ),
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 15.0,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w800,
              ),
        ),
        Text(
          '${widget.nutrient?.value}${widget.nutrient?.unit}',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 15.0,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w800,
              ),
        ),
      ],
    );
  }
}
