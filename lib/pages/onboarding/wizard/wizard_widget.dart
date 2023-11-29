import '/components/avatar_menu/avatar_menu_widget.dart';
import '/components/component_heading_widget.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/components/personal_info/personal_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wizard_model.dart';
export 'wizard_model.dart';

class WizardWidget extends StatefulWidget {
  const WizardWidget({Key? key}) : super(key: key);

  @override
  _WizardWidgetState createState() => _WizardWidgetState();
}

class _WizardWidgetState extends State<WizardWidget> {
  late WizardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WizardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Wizard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().imageName == null || FFAppState().imageName == '') {
        setState(() {
          FFAppState().imageName = 'abc';
        });
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: SingleChildScrollView(
                          controller: _model.columnController1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/nu3foodLogo.png',
                                  width: 176.0,
                                  height: 54.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: wrapWithModel(
                                  model: _model.componentHeadingModel1,
                                  updateCallback: () => setState(() {}),
                                  child: ComponentHeadingWidget(
                                    title: FFLocalizations.of(context).getText(
                                      '3wtz1sbg' /* Create your profile */,
                                    ),
                                    description:
                                        FFLocalizations.of(context).getText(
                                      'hflbvdxk' /* The completed data will only b... */,
                                    ),
                                    spacing: 6,
                                    titleSize: 24,
                                    descriptionSize: 18,
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.avatarMenuModel,
                                updateCallback: () => setState(() {}),
                                child: AvatarMenuWidget(),
                              ),
                              wrapWithModel(
                                model: _model.personalInfoModel,
                                updateCallback: () => setState(() {}),
                                child: PersonalInfoWidget(
                                  greetingText:
                                      FFLocalizations.of(context).getText(
                                    'nhigx45s' /* Fill out your information */,
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 24.0))
                                .addToStart(SizedBox(height: 50.0))
                                .addToEnd(SizedBox(height: 150.0)),
                          ),
                        ),
                      ),
                      if (!(isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible))
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.95),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF382F73),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 10.0, 12.0, 10.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ju5x2gug' /* Continue to next step */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFFB7C1FA),
                                                    letterSpacing: 0.15,
                                                    fontWeight: FontWeight.w800,
                                                    lineHeight: 1.5,
                                                  ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                              'assets/images/arrow.svg',
                                              width: 15.0,
                                              height: 15.8,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 10.0, 12.0, 10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().IsGuest = true;

                                          context.goNamed('Home');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'b7er5pp3' /* Continue without registration */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF382F73),
                                                letterSpacing: 0.15,
                                                fontWeight: FontWeight.w800,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: SingleChildScrollView(
                          controller: _model.columnController2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/nu3foodLogo.png',
                                  width: 176.0,
                                  height: 54.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: wrapWithModel(
                                  model: _model.componentHeadingModel2,
                                  updateCallback: () => setState(() {}),
                                  child: ComponentHeadingWidget(
                                    title: 'Tell us something about you',
                                    description:
                                        FFLocalizations.of(context).getText(
                                      'u8l8bemr' /* The completed data will only b... */,
                                    ),
                                    spacing: 6,
                                    titleSize: 24,
                                    descriptionSize: 18,
                                  ),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.intoleranciesModel,
                                updateCallback: () => setState(() {}),
                                child: IntoleranciesWidget(),
                              ),
                              if (FFAppState().medicaments)
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.medicationModel,
                                    updateCallback: () => setState(() {}),
                                    child: MedicationWidget(
                                      shouldShowLink: false,
                                      whereToScroll: () async {
                                        await _model.columnController2
                                            ?.animateTo(
                                          _model.columnController2!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ]
                                .divide(SizedBox(height: 24.0))
                                .addToStart(SizedBox(height: 50.0))
                                .addToEnd(SizedBox(height: 120.0)),
                          ),
                        ),
                      ),
                      if (!(isWeb
                          ? MediaQuery.viewInsetsOf(context).bottom > 0
                          : _isKeyboardVisible))
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.95),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await _model.pageViewController
                                                ?.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF382F73),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/arrow_back.svg',
                                                  width: 15.0,
                                                  height: 15.75,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().IsGuest = false;

                                              context.goNamed('Home');
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF382F73),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 10.0, 12.0, 10.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'iyvefphs' /* Finish registration */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            Color(0xFFB7C1FA),
                                                        letterSpacing: 0.15,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
