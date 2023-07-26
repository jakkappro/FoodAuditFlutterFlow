import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/open_scanner_button/open_scanner_button_widget.dart';
import '/components/scanned_items/scanned_items_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => setState(() {}),
                      child: HeaderWidget(),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 228.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: wrapWithModel(
                          model: _model.scannedItemsModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: ScannedItemsWidget(),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.intoleranciesModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: IntoleranciesWidget(),
                    ),
                    Container(
                      width: 1.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    PagedListView<DocumentSnapshot<Object?>?, ProductsRecord>(
                      pagingController: _model.setListViewController1(
                        ProductsRecord.collection,
                      ),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate:
                          PagedChildBuilderDelegate<ProductsRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewProductsRecord = _model
                              .listViewPagingController1!
                              .itemList![listViewIndex];
                          return Container(
                            width: double.infinity,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  listViewProductsRecord.product.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                      ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final ingredient = listViewProductsRecord
                                        .product.ingredients
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: ingredient.length,
                                      itemBuilder: (context, ingredientIndex) {
                                        final ingredientItem =
                                            ingredient[ingredientIndex];
                                        return Text(
                                          ingredientItem.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Colors.white,
                                              ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 15.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.openScannerButtonModel,
                  updateCallback: () => setState(() {}),
                  child: OpenScannerButtonWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
