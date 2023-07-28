import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/intolerancies/intolerancies_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_up_wizard_model.dart';
export 'set_up_wizard_model.dart';

class SetUpWizardWidget extends StatefulWidget {
  const SetUpWizardWidget({Key? key}) : super(key: key);

  @override
  _SetUpWizardWidgetState createState() => _SetUpWizardWidgetState();
}

class _SetUpWizardWidgetState extends State<SetUpWizardWidget>
    with TickerProviderStateMixin {
  late SetUpWizardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered1 = false;
  var hasIntoleranciesTriggered = false;
  var hasButtonTriggered2 = false;
  final animationsMap = {
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'intoleranciesOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetUpWizardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SetUpWizard'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'x85xnccp' /* Male */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'a6mpwtmr' /* Female */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'isl7gm5u' /* Attack helicopter */,
                                        )
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.dropDownValue = val);
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          gender: _model.dropDownValue,
                                        ));
                                        if (animationsMap[
                                                'buttonOnActionTriggerAnimation1'] !=
                                            null) {
                                          setState(
                                              () => hasButtonTriggered1 = true);
                                          SchedulerBinding.instance
                                              .addPostFrameCallback((_) async =>
                                                  await animationsMap[
                                                          'buttonOnActionTriggerAnimation1']!
                                                      .controller
                                                      .forward(from: 0.0));
                                        }
                                      },
                                      width: double.infinity,
                                      height: double.infinity,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'w61s7h17' /* Please select gender */,
                                      ),
                                      icon: Icon(
                                        Icons.ten_k,
                                        size: 0.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Container(
                                    width: 30.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
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

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  dateOfBirth: _model.datePicked,
                                ));
                                if (animationsMap[
                                        'intoleranciesOnActionTriggerAnimation'] !=
                                    null) {
                                  setState(
                                      () => hasIntoleranciesTriggered = true);
                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
                                              'intoleranciesOnActionTriggerAnimation']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation2'] !=
                                    null) {
                                  setState(() => hasButtonTriggered2 = true);
                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
                                              'buttonOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                              },
                              text: dateTimeFormat(
                                        'relative',
                                        currentUserDocument?.dateOfBirth,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ) ==
                                      ''
                                  ? 'Datum narodenia'
                                  : dateTimeFormat(
                                      'yMMMd',
                                      currentUserDocument!.dateOfBirth!,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lato',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ).animateOnActionTrigger(
                                animationsMap[
                                    'buttonOnActionTriggerAnimation1']!,
                                hasBeenTriggered: hasButtonTriggered1),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (animationsMap[
                                    'buttonOnActionTriggerAnimation2'] !=
                                null) {
                              setState(() => hasButtonTriggered2 = true);
                              SchedulerBinding.instance.addPostFrameCallback(
                                  (_) async => await animationsMap[
                                          'buttonOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0));
                            }
                          },
                          child: wrapWithModel(
                            model: _model.intoleranciesModel,
                            updateCallback: () => setState(() {}),
                            child: IntoleranciesWidget(),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'intoleranciesOnActionTriggerAnimation']!,
                            hasBeenTriggered: hasIntoleranciesTriggered),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('Home');
                            },
                            text: FFLocalizations.of(context).getText(
                              'cdn68h8g' /* Hotofo */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation2']!,
                              hasBeenTriggered: hasButtonTriggered2),
                        ),
                      ],
                    ),
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
