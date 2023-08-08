import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/components/medication/medication_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_up_wizard_model.dart';
export 'set_up_wizard_model.dart';

class SetUpWizardWidget extends StatefulWidget {
  const SetUpWizardWidget({Key? key}) : super(key: key);

  @override
  _SetUpWizardWidgetState createState() => _SetUpWizardWidgetState();
}

class _SetUpWizardWidgetState extends State<SetUpWizardWidget> {
  late SetUpWizardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetUpWizardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SetUpWizard'});
    _model.textController ??= TextEditingController();
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
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: SingleChildScrollView(
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
                        Text(
                          FFLocalizations.of(context).getText(
                            's2jlw2ps' /* Tell us something about yourse... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF382F73),
                                    fontSize: 24.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.4,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '79rj6c2w' /* Filled information will be use... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 18.0,
                                    letterSpacing: 0.15,
                                    lineHeight: 1.5,
                                  ),
                        ),
                        wrapWithModel(
                          model: _model.intoleranciesModel,
                          updateCallback: () => setState(() {}),
                          child: IntoleranciesWidget(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: wrapWithModel(
                            model: _model.medicationModel,
                            updateCallback: () => setState(() {}),
                            child: MedicationWidget(),
                          ),
                        ),
                        Container(
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
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 10.0, 12.0, 10.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'gnmmag3h' /* Continue to next step */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
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
                                        child: Image.asset(
                                          'assets/images/arrow.png',
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
                                        '4r1fe3w6' /* Continue without registration */,
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
                      ]
                          .divide(SizedBox(height: 24.0))
                          .addToEnd(SizedBox(height: 25.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'sskvope2' /* Create your profile */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF382F73),
                                    fontSize: 24.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '99tutfdt' /* Selected information will be u... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFFAFACC7),
                                    fontSize: 18.0,
                                    letterSpacing: 0.15,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ].divide(SizedBox(height: 6.0)),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 147.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'gb75oux8' /* Choose your avatar */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF382F73),
                                    fontSize: 20.0,
                                    letterSpacing: 0.15,
                                    fontWeight: FontWeight.w800,
                                    lineHeight: 1.4,
                                  ),
                            ),
                            Wrap(
                              spacing: 12.0,
                              runSpacing: 12.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().imageName = '1';
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Frame_32.png',
                                      width: 47.5,
                                      height: 47.5,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().imageName = '2';
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Frame_33.png',
                                      width: 47.5,
                                      height: 47.5,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().imageName = '03';
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Frame_34.png',
                                      width: 47.5,
                                      height: 47.5,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_35.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_36.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_37.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_38.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_39.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_40_(1).png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_41.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Property_1=Default.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/Frame_46.png',
                                    width: 47.5,
                                    height: 47.5,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'qfoz89yq' /* Fill out your information */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF382F73),
                                      fontSize: 20.0,
                                      letterSpacing: 0.15,
                                      fontWeight: FontWeight.w800,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                    color: Color(0xFFAFACC7),
                                    width: 2.0,
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          displayName:
                                              _model.textController.text,
                                        ));
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText:
                                          FFLocalizations.of(context).getText(
                                        'kx71vf2v' /* Name */,
                                      ),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: Color(0xFF382F73),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            lineHeight: 1.5,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 10.0, 16.0, 10.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          lineHeight: 1.5,
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: DateTime(1900),
                                    lastDate: getCurrentTimestamp,
                                  );

                                  if (_datePickedDate != null) {
                                    setState(() {
                                      _model.datePicked = DateTime(
                                        _datePickedDate.year,
                                        _datePickedDate.month,
                                        _datePickedDate.day,
                                      );
                                    });
                                  }
                                  setState(() {
                                    FFAppState().dateOfBirdth =
                                        _model.datePicked;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color: Color(0xFFAFACC7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 10.0, 16.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'c50pq66g' /* Date of birdth */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF382F73),
                                                fontSize: 16.0,
                                                letterSpacing: 0.15,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.55,
                                              ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/Calendar.png',
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      '34glw7np' /* Male */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '6emn5jy4' /* Femlae */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'r8zdm8lg' /* Attach hellicopter */,
                                    )
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    setState(() {
                                      FFAppState().gender =
                                          _model.dropDownValue!;
                                    });
                                  },
                                  width: double.infinity,
                                  height: 45.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF382F73),
                                        fontSize: 16.0,
                                        letterSpacing: 0.15,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.55,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'qczcjtfi' /* Pohlavie */,
                                  ),
                                  icon: Icon(
                                    Icons.fingerprint,
                                    color: Color(0xFF382F73),
                                    size: 24.0,
                                  ),
                                  fillColor: Colors.transparent,
                                  elevation: 0.0,
                                  borderColor: Color(0xFFAFACC7),
                                  borderWidth: 2.0,
                                  borderRadius: 6.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 16.0, 10.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
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
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF382F73),
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 10.0, 12.0, 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/arrow.png',
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 10.0, 12.0, 10.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'xpyhbzo6' /* Finish registration */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().IsGuest = true;

                                context.goNamed('Home');
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 10.0, 12.0, 10.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4akg6i4y' /* Continue without registration */,
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
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
