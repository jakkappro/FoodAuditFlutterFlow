import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recycle_info_model.dart';
export 'recycle_info_model.dart';

class RecycleInfoWidget extends StatefulWidget {
  const RecycleInfoWidget({super.key});

  @override
  State<RecycleInfoWidget> createState() => _RecycleInfoWidgetState();
}

class _RecycleInfoWidgetState extends State<RecycleInfoWidget> {
  late RecycleInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecycleInfoModel());
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
