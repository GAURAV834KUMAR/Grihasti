import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_addres_model.dart';
export 'edit_addres_model.dart';

class EditAddresWidget extends StatefulWidget {
  const EditAddresWidget({
    Key? key,
    this.address,
  }) : super(key: key);

  final AdressRecord? address;

  @override
  _EditAddresWidgetState createState() => _EditAddresWidgetState();
}

class _EditAddresWidgetState extends State<EditAddresWidget> {
  late EditAddresModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAddresModel());

    _model.nameController ??= TextEditingController(text: widget.address!.name);
    _model.mobileNoController ??=
        TextEditingController(text: widget.address!.phoneNo);
    _model.pinCodeController ??=
        TextEditingController(text: widget.address!.pINCode.toString());
    _model.addresController ??=
        TextEditingController(text: widget.address!.adress);
    _model.areaController ??= TextEditingController(text: widget.address!.area);
    _model.landmarkController ??=
        TextEditingController(text: widget.address!.landmark);
    _model.townController ??=
        TextEditingController(text: widget.address!.townCityName);
    _model.stateController ??=
        TextEditingController(text: widget.address!.state);
    _model.districtController ??=
        TextEditingController(text: widget.address!.district);
    _model.countryController ??=
        TextEditingController(text: widget.address!.country);
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Text(
              'CANCEL',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Titan One',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Edit your address',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.nameController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.nameController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'Name',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.nameController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.nameController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          keyboardType: TextInputType.name,
                          validator: _model.nameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.mobileNoController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.mobileNoController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Mobile No.',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: '10-digit mobile number',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon:
                                _model.mobileNoController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.mobileNoController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          keyboardType: TextInputType.phone,
                          validator: _model.mobileNoControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.pinCodeController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.pinCodeController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'PIN Code',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: '6-digit PIN Code',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon:
                                _model.pinCodeController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.pinCodeController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          keyboardType: TextInputType.number,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.addresController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.addresController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Flat, House no., Building name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'Flat, House no., Building name',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.addresController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.addresController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          keyboardType: TextInputType.streetAddress,
                          validator: _model.addresControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.areaController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.areaController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Road name, Area, Colony',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'Road name, Area, Colony',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.areaController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.areaController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          validator: _model.areaControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.landmarkController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.landmarkController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Landmark',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'Famous shop or mall nearby',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon:
                                _model.landmarkController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.landmarkController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          validator: _model.landmarkControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.townController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.townController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Town / City',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'Town / City Name',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.townController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.townController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          validator: _model.townControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.stateController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.stateController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'State',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'State',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon: _model.stateController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.stateController?.clear();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          validator: _model.stateControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.districtController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.districtController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'District',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'District',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon:
                                _model.districtController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.districtController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          validator: _model.districtControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: TextFormField(
                          controller: _model.countryController,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.countryController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Country',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontWeight: FontWeight.w600,
                                ),
                            hintText: 'Country',
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            suffixIcon:
                                _model.countryController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.countryController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontWeight: FontWeight.w600,
                                  ),
                          validator: _model.countryControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SwitchListTile(
                                value: _model.switchListTileValue ??=
                                    widget.address!.defaultAdd,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue = newValue!);
                                },
                                title: Text(
                                  'Make this my default address',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        fontSize: 16.0,
                                      ),
                                ),
                                tileColor: Color(0xFFF5F5F5),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 5.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Address Type',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 8.0, 15.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??=
                                widget.address!.addressType,
                          ),
                          options: [
                            'Home (7 am - 9pm delivery)',
                            'Office/Commercial ( 10A AM - 6PM delivery)'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: 55.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                  ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 1.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget.address!.reference
                                .update(createAdressRecordData(
                              name: _model.nameController.text,
                              phoneNo: _model.mobileNoController.text,
                              pINCode:
                                  int.tryParse(_model.pinCodeController.text),
                              area: _model.areaController.text,
                              landmark: _model.landmarkController.text,
                              townCityName: _model.townController.text,
                              district: _model.districtController.text,
                              state: _model.stateController.text,
                              country: _model.countryController.text,
                              adress: _model.addresController.text,
                              addressType: _model.dropDownValue,
                              defaultAdd: _model.switchListTileValue,
                            ));
                            triggerPushNotification(
                              notificationTitle: 'Edited Successfully',
                              notificationText:
                                  'Your adress has been edited successfully.',
                              notificationSound: 'default',
                              userRefs: [widget.address!.userid!],
                              initialPageName: 'Your_Address',
                              parameterData: {},
                            );
                            Navigator.pop(context);
                          },
                          text: 'Use this address',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).buttoncolor,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
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
