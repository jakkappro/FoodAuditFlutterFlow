import '/components/scanned_item/scanned_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scanned_items_model.dart';
export 'scanned_items_model.dart';

class ScannedItemsWidget extends StatefulWidget {
  const ScannedItemsWidget({Key? key}) : super(key: key);

  @override
  _ScannedItemsWidgetState createState() => _ScannedItemsWidgetState();
}

class _ScannedItemsWidgetState extends State<ScannedItemsWidget> {
  late ScannedItemsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScannedItemsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 0.0, 0.0),
      child: Builder(
        builder: (context) {
          final scannedItem = FFAppState().ScannedItems.toList();
          return ListView.separated(
            padding: EdgeInsets.fromLTRB(
              0,
              0,
              5.0,
              0,
            ),
            primary: false,
            scrollDirection: Axis.horizontal,
            itemCount: scannedItem.length,
            separatorBuilder: (_, __) => SizedBox(width: 15.0),
            itemBuilder: (context, scannedItemIndex) {
              final scannedItemItem = scannedItem[scannedItemIndex];
              return ScannedItemWidget(
                key: Key('Keygzp_${scannedItemIndex}_of_${scannedItem.length}'),
                scannedItem: scannedItemItem,
              );
            },
          );
        },
      ),
    );
  }
}
