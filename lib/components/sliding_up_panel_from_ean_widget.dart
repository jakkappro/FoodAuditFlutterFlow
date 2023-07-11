import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

    return Container();
  }
}
