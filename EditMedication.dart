import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'edit_medication_model.dart';
export 'edit_medication_model.dart';

class EditMedicationWidget extends StatefulWidget {
  const EditMedicationWidget({super.key});

  @override
  State<EditMedicationWidget> createState() => _EditMedicationWidgetState();
}

class _EditMedicationWidgetState extends State<EditMedicationWidget> {
  late EditMedicationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditMedicationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.query = await queryUserMedicinesRecordOnce(
        queryBuilder: (userMedicinesRecord) => userMedicinesRecord
            .where(
              'name',
              isEqualTo: FFAppState().medicationName,
            )
            .where(
              'userID',
              isEqualTo: currentUserUid,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().isMonday = _model.query!.isMonday;
      FFAppState().isTuesday = _model.query!.isTuesday;
      FFAppState().isWednesday = _model.query!.isWednesday;
      FFAppState().isThursday = _model.query!.isThursday;
      FFAppState().isFriday = _model.query!.isFriday;
      FFAppState().isSaturday = _model.query!.isSaturday;
      FFAppState().isSunday = _model.query!.isSunday;
      safeSetState(() {});
    });

    _model.dosesPerDayTextController ??=
        TextEditingController(text: _model.query?.dosage?.toString());
    _model.dosesPerDayFocusNode ??= FocusNode();

    _model.quantityTextController ??= TextEditingController();
    _model.quantityFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.quantityTextController?.text = '0';
        }));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, FlutterFlowTheme.of(context).secondary],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              35.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed('LandingPage');
                            },
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Back',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 0.0, 0.0),
                    child: Text(
                      'Edit Medication',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 0.0, 0.0),
                    child: Text(
                      FFAppState().medicationName,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Unit',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.unitValueController ??=
                                    FormFieldController<String>(
                                  _model.unitValue ??= _model.query?.unit,
                                ),
                                options: [
                                  'ml',
                                  'capsule(s)',
                                  'drop(s)',
                                  'gram(s)',
                                  'injection(s)',
                                  'mg',
                                  'pill(s)',
                                  'spray(s)',
                                  'tablespoon(s)',
                                  'teaspoon(s)',
                                  'unit(s)'
                                ],
                                onChanged: (val) =>
                                    safeSetState(() => _model.unitValue = val),
                                width: 120.0,
                                height: 40.0,
                                searchHintTextStyle:
                                    FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                searchTextStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Select...',
                                searchHintText: 'Search...',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: Colors.white,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 16.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: true,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'dosage',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  child: TextFormField(
                                    controller:
                                        _model.dosesPerDayTextController,
                                    focusNode: _model.dosesPerDayFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.dosesPerDayTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        FFAppState().dosesPerDay = _model
                                            .dosesPerDayTextController.text;
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .dosesPerDayTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Add Quantity',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 200.0, 0.0),
                          child: Container(
                            width: 50.0,
                            child: TextFormField(
                              controller: _model.quantityTextController,
                              focusNode: _model.quantityFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.number,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.quantityTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Select Days',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().isMonday =
                                        !(FFAppState().isMonday ?? true);
                                    safeSetState(() {});
                                    if (FFAppState().isMonday != null) {
                                      FFAppState().addToMedDays('Monday');
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().removeFromMedDays('Monday');
                                      safeSetState(() {});
                                    }
                                  },
                                  text: 'Mon',
                                  options: FFButtonOptions(
                                    width: 44.0,
                                    height: 65.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: valueOrDefault<Color>(
                                      FFAppState().isMonday
                                          ? FlutterFlowTheme.of(context).primary
                                          : Colors.white,
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: valueOrDefault<Color>(
                                            FFAppState().isMonday
                                                ? Colors.white
                                                : Colors.black,
                                            Colors.white,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().isTuesday =
                                          !(FFAppState().isTuesday ?? true);
                                      safeSetState(() {});
                                      if (FFAppState().isTuesday) {
                                        FFAppState().addToMedDays('Tuesday');
                                        safeSetState(() {});
                                      } else {
                                        FFAppState()
                                            .removeFromMedDays('Tuesday');
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Tue',
                                    options: FFButtonOptions(
                                      width: 44.0,
                                      height: 65.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        FFAppState().isTuesday
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Colors.white,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              FFAppState().isTuesday
                                                  ? Colors.white
                                                  : Colors.black,
                                              Colors.white,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().isWednesday =
                                          !(FFAppState().isWednesday ?? true);
                                      safeSetState(() {});
                                      if (FFAppState().isWednesday) {
                                        FFAppState().addToMedDays('Wednesday');
                                        safeSetState(() {});
                                      } else {
                                        FFAppState()
                                            .removeFromMedDays('Wednesday');
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Wed',
                                    options: FFButtonOptions(
                                      width: 44.0,
                                      height: 65.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        FFAppState().isWednesday
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Colors.white,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              FFAppState().isWednesday
                                                  ? Colors.white
                                                  : Colors.black,
                                              Colors.white,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().isThursday =
                                          !(FFAppState().isThursday ?? true);
                                      safeSetState(() {});
                                      if (FFAppState().isThursday) {
                                        FFAppState().addToMedDays('Thursday');
                                        safeSetState(() {});
                                      } else {
                                        FFAppState()
                                            .removeFromMedDays('Thursday');
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Thu',
                                    options: FFButtonOptions(
                                      width: 44.0,
                                      height: 65.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        FFAppState().isThursday
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Colors.white,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              FFAppState().isThursday
                                                  ? Colors.white
                                                  : Colors.black,
                                              Colors.white,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().isFriday =
                                          !(FFAppState().isFriday ?? true);
                                      safeSetState(() {});
                                      if (FFAppState().isFriday) {
                                        FFAppState().addToMedDays('Friday');
                                        safeSetState(() {});
                                      } else {
                                        FFAppState()
                                            .removeFromMedDays('Friday');
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Fri',
                                    options: FFButtonOptions(
                                      width: 44.0,
                                      height: 65.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        FFAppState().isFriday
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Colors.white,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              FFAppState().isFriday
                                                  ? Colors.white
                                                  : Colors.black,
                                              Colors.white,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().isSaturday =
                                          !(FFAppState().isSaturday ?? true);
                                      safeSetState(() {});
                                      if (FFAppState().isSaturday) {
                                        FFAppState().addToMedDays('Saturday');
                                        safeSetState(() {});
                                      } else {
                                        FFAppState()
                                            .removeFromMedDays('Saturday');
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Sat',
                                    options: FFButtonOptions(
                                      width: 44.0,
                                      height: 65.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        FFAppState().isSaturday
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Colors.white,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              FFAppState().isSaturday
                                                  ? Colors.white
                                                  : Colors.black,
                                              Colors.white,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().isSunday =
                                          !(FFAppState().isSunday ?? true);
                                      safeSetState(() {});
                                      if (FFAppState().isSunday) {
                                        FFAppState().addToMedDays('Sunday');
                                        safeSetState(() {});
                                      } else {
                                        FFAppState()
                                            .removeFromMedDays('Sunday');
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Sun',
                                    options: FFButtonOptions(
                                      width: 44.0,
                                      height: 65.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        FFAppState().isSunday
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Colors.white,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: valueOrDefault<Color>(
                                              FFAppState().isSunday
                                                  ? Colors.white
                                                  : Colors.black,
                                              Colors.white,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet<bool>(
                          context: context,
                          builder: (context) {
                            final _datePickedCupertinoTheme =
                                CupertinoTheme.of(context);
                            return Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              child: CupertinoTheme(
                                data: _datePickedCupertinoTheme.copyWith(
                                  textTheme: _datePickedCupertinoTheme.textTheme
                                      .copyWith(
                                    dateTimePickerTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                  ),
                                ),
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  minimumDate: DateTime(1900),
                                  initialDateTime: getCurrentTimestamp,
                                  maximumDate: DateTime(2050),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  use24hFormat: false,
                                  onDateTimeChanged: (newDateTime) =>
                                      safeSetState(() {
                                    _model.datePicked = newDateTime;
                                  }),
                                ),
                              ),
                            );
                          });

                      await UserMedicinesRecord.collection.doc().set({
                        ...createUserMedicinesRecordData(
                          dosage: int.tryParse(
                              _model.dosesPerDayTextController.text),
                          isMonday: FFAppState().isMonday,
                          isTuesday: FFAppState().isTuesday,
                          isWednesday: FFAppState().isWednesday,
                          isThursday: FFAppState().isThursday,
                          isFriday: FFAppState().isFriday,
                          isSaturday: FFAppState().isSaturday,
                          isSunday: FFAppState().isSunday,
                          name: FFAppState().medicationName,
                          unit: _model.unitValue,
                          userID: currentUserUid,
                          timeOfDosage: _model.datePicked,
                        ),
                        ...mapToFirestore(
                          {
                            'medDays': FFAppState().medDays,
                          },
                        ),
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Select medication timeslots',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 140.0, 0.0),
                          child: Icon(
                            Icons.add_circle_outline,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<UserMedicinesRecord>>(
                          stream: queryUserMedicinesRecord(
                            queryBuilder: (userMedicinesRecord) =>
                                userMedicinesRecord
                                    .where(
                                      'userID',
                                      isEqualTo: currentUserUid,
                                    )
                                    .where(
                                      'name',
                                      isEqualTo: FFAppState().medicationName,
                                    ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserMedicinesRecord>
                                listViewUserMedicinesRecordList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewUserMedicinesRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewUserMedicinesRecord =
                                    listViewUserMedicinesRecordList[
                                        listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 15.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 7.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAF6F6),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "d/M h:mm a",
                                                  listViewUserMedicinesRecord
                                                      .timeOfDosage,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Add new Time',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 30.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await listViewUserMedicinesRecord
                                                    .reference
                                                    .delete();
                                              },
                                              child: Icon(
                                                Icons.remove_circle_outline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      unawaited(
                        () async {
                          await _model.query!.reference.update({
                            ...createUserMedicinesRecordData(
                              dosage: int.tryParse(
                                  _model.dosesPerDayTextController.text),
                              isMonday: FFAppState().isMonday,
                              isTuesday: FFAppState().isTuesday,
                              isWednesday: FFAppState().isWednesday,
                              isThursday: FFAppState().isThursday,
                              isFriday: FFAppState().isFriday,
                              isSaturday: FFAppState().isSaturday,
                              isSunday: FFAppState().isSunday,
                              name: FFAppState().medicationName,
                              unit: _model.unitValue,
                              userID: currentUserUid,
                            ),
                            ...mapToFirestore(
                              {
                                'medDays': FFAppState().medDays,
                              },
                            ),
                          });
                        }(),
                      );
                      _model.countOfMedication =
                          await queryMedicationCountRecordOnce(
                        queryBuilder: (medicationCountRecord) =>
                            medicationCountRecord
                                .where(
                                  'userID',
                                  isEqualTo: currentUserUid,
                                )
                                .where(
                                  'name',
                                  isEqualTo: FFAppState().medicationName,
                                ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);

                      await _model.countOfMedication!.reference.update({
                        ...createMedicationCountRecordData(
                          dosage: int.tryParse(
                              _model.dosesPerDayTextController.text),
                          unit: _model.unitValue,
                        ),
                        ...mapToFirestore(
                          {
                            'count': FieldValue.increment(
                                int.parse(_model.quantityTextController.text)),
                          },
                        ),
                      });

                      context.pushNamed('LandingPage');

                      safeSetState(() {});
                    },
                    text: 'Edit Medication',
                    options: FFButtonOptions(
                      width: 176.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
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
