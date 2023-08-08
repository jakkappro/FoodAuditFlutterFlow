import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_user_model.dart';
export 'image_user_model.dart';

class ImageUserWidget extends StatefulWidget {
  const ImageUserWidget({Key? key}) : super(key: key);

  @override
  _ImageUserWidgetState createState() => _ImageUserWidgetState();
}

class _ImageUserWidgetState extends State<ImageUserWidget> {
  late ImageUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageUserModel());
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
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/lightBulb.png',
            width: 34.0,
            height: 34.0,
            fit: BoxFit.cover,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/arrow.png',
            width: 300.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
