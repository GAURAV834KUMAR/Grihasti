import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/delivery_address/delivery_address_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sucess_page/sucess_page_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_confirmation_model.dart';
export 'order_confirmation_model.dart';

class OrderConfirmationWidget extends StatefulWidget {
  const OrderConfirmationWidget({
    Key? key,
    this.proid,
    this.address,
    this.psql,
  }) : super(key: key);

  final ProductMasterRecord? proid;
  final AdressRecord? address;
  final dynamic psql;

  @override
  _OrderConfirmationWidgetState createState() =>
      _OrderConfirmationWidgetState();
}

class _OrderConfirmationWidgetState extends State<OrderConfirmationWidget>
    with TickerProviderStateMixin {
  late OrderConfirmationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(0.0, 120.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderConfirmationModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Order Now',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Delivering To :',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget.address!.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            if (functions.mrpequalrate(
                                    getJsonField(
                                      widget.psql,
                                      r'''$..mrp''',
                                    ),
                                    functions
                                        .defaultcd(
                                            getJsonField(
                                              widget.psql,
                                              r'''$..rate''',
                                            ),
                                            getJsonField(
                                              widget.psql,
                                              r'''$..default_cd''',
                                            ))
                                        .toDouble()) ==
                                true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Mrp:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.8, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            formatNumber(
                                              functions.format(getJsonField(
                                                widget.psql,
                                                r'''$..mrp''',
                                              )),
                                              formatType: FormatType.custom,
                                              format: '₹ ##,###',
                                              locale: '',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Our Price:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.8, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          formatNumber(
                                            functions.defaultcd(
                                                getJsonField(
                                                  widget.psql,
                                                  r'''$..rate''',
                                                ),
                                                getJsonField(
                                                  widget.psql,
                                                  r'''$..default_cd''',
                                                )),
                                            formatType: FormatType.custom,
                                            format: '₹ ##,###',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (functions.mrpequalrate(
                                    getJsonField(
                                      widget.psql,
                                      r'''$..mrp''',
                                    ),
                                    functions
                                        .defaultcd(
                                            getJsonField(
                                              widget.psql,
                                              r'''$..rate''',
                                            ),
                                            getJsonField(
                                              widget.psql,
                                              r'''$..default_cd''',
                                            ))
                                        .toDouble()) ==
                                true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Discount:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.8, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            '${formatNumber(
                                              functions.discount(
                                                  functions
                                                      .defaultcd(
                                                          getJsonField(
                                                            widget.psql,
                                                            r'''$..rate''',
                                                          ),
                                                          getJsonField(
                                                            widget.psql,
                                                            r'''$..default_cd''',
                                                          ))
                                                      .toDouble(),
                                                  getJsonField(
                                                    widget.psql,
                                                    r'''$..mrp''',
                                                  )),
                                              formatType: FormatType.custom,
                                              format: '-₹ ##,###',
                                              locale: '',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Order Total:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.8, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '${formatNumber(
                                            functions.defaultcd(
                                                getJsonField(
                                                  widget.psql,
                                                  r'''$..rate''',
                                                ),
                                                getJsonField(
                                                  widget.psql,
                                                  r'''$..default_cd''',
                                                )),
                                            formatType: FormatType.custom,
                                            format: '₹ ##,###',
                                            locale: '',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Delivery Charges :',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.85, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Text(
                                        'To be notify',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Subtotal:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.8, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          formatNumber(
                                            functions.defaultcd(
                                                getJsonField(
                                                  widget.psql,
                                                  r'''$..rate''',
                                                ),
                                                getJsonField(
                                                  widget.psql,
                                                  r'''$..default_cd''',
                                                )),
                                            formatType: FormatType.custom,
                                            format: '₹ ##,###',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
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
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Pay with',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.85, 0.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Pay on delivery (Cash/Card)',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: DeliveryAddressWidget(
                                proid: widget.proid,
                              ),
                            ),
                            (r) => false,
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Deliver to',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.85, 0.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        widget.address!.name,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${widget.address!.adress}, ${widget.address!.area}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Add delivery instructions',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.6, 0.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 30.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 5.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'DELIVERY TIME : ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .delivery2,
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.8, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .delivery2,
                                              size: 26.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '02 / 03 hrs.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .delivery2,
                                                      fontSize: 16.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget.proid!.photoOnList,
                                        'https://cdn-icons-png.flaticon.com/512/401/401061.png',
                                      ),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 0.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              widget.proid!.itemMaster,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (functions.mrpequalrate(
                                                      getJsonField(
                                                        widget.psql,
                                                        r'''$..mrp''',
                                                      ),
                                                      functions
                                                          .defaultcd(
                                                              getJsonField(
                                                                widget.psql,
                                                                r'''$..rate''',
                                                              ),
                                                              getJsonField(
                                                                widget.psql,
                                                                r'''$..default_cd''',
                                                              ))
                                                          .toDouble()) ==
                                                  true)
                                                Text(
                                                  '₹ ${getJsonField(
                                                    widget.psql,
                                                    r'''$..mrp''',
                                                  ).toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  formatNumber(
                                                    functions.defaultcd(
                                                        getJsonField(
                                                          widget.psql,
                                                          r'''$..rate''',
                                                        ),
                                                        getJsonField(
                                                          widget.psql,
                                                          r'''$..default_cd''',
                                                        )),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '₹ ##,###',
                                                    locale: '',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color: Colors.red,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Container(
                                              width: 100.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: Color(0xFF9E9E9E),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => FaIcon(
                                                  FontAwesomeIcons.minus,
                                                  color: enabled
                                                      ? Color(0xDD000000)
                                                      : Color(0xFFEEEEEE),
                                                  size: 18.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  color: enabled
                                                      ? Colors.blue
                                                      : Color(0xFFEEEEEE),
                                                  size: 20.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                count: _model
                                                    .countControllerValue ??= 1,
                                                updateCount: (count) =>
                                                    setState(() => _model
                                                            .countControllerValue =
                                                        count),
                                                stepSize: 1,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10.0, 0.0,
                                                            10.0, 0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<ViratUserRecord>>(
              stream: queryViratUserRecord(
                queryBuilder: (viratUserRecord) =>
                    viratUserRecord.where('Is_Admin', isEqualTo: 'True'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitDoubleBounce(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<ViratUserRecord> bottomButtonAreaViratUserRecordList =
                    snapshot.data!;
                return Material(
                  color: Colors.transparent,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x55000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 52.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var orderDetailsRecordReference =
                              OrderDetailsRecord.collection.doc();
                          await orderDetailsRecordReference
                              .set(createOrderDetailsRecordData(
                            userId: currentUserReference,
                            aid: widget.address!.reference,
                            orderTime: getCurrentTimestamp,
                            orderStatus: 'Order Placed',
                            deliveryDate: getCurrentTimestamp,
                            deliveryTime: '02 / 03',
                            isDeliveryTime: true,
                            subtotal: functions
                                .defaultcd(
                                    getJsonField(
                                      widget.psql,
                                      r'''$..rate''',
                                    ),
                                    getJsonField(
                                      widget.psql,
                                      r'''$..default_cd''',
                                    ))
                                .toDouble(),
                            isDelivered: false,
                            deliveryCharges: 0.0,
                            deliveryCharFree: false,
                            isDeliveryCharge: false,
                            isOrder: true,
                            noOfItems: 1,
                            mrp: getJsonField(
                              widget.psql,
                              r'''$..mrp''',
                            ),
                          ));
                          _model.oederDetails =
                              OrderDetailsRecord.getDocumentFromData(
                                  createOrderDetailsRecordData(
                                    userId: currentUserReference,
                                    aid: widget.address!.reference,
                                    orderTime: getCurrentTimestamp,
                                    orderStatus: 'Order Placed',
                                    deliveryDate: getCurrentTimestamp,
                                    deliveryTime: '02 / 03',
                                    isDeliveryTime: true,
                                    subtotal: functions
                                        .defaultcd(
                                            getJsonField(
                                              widget.psql,
                                              r'''$..rate''',
                                            ),
                                            getJsonField(
                                              widget.psql,
                                              r'''$..default_cd''',
                                            ))
                                        .toDouble(),
                                    isDelivered: false,
                                    deliveryCharges: 0.0,
                                    deliveryCharFree: false,
                                    isDeliveryCharge: false,
                                    isOrder: true,
                                    noOfItems: 1,
                                    mrp: getJsonField(
                                      widget.psql,
                                      r'''$..mrp''',
                                    ),
                                  ),
                                  orderDetailsRecordReference);

                          await OrdersRecord.collection
                              .doc()
                              .set(createOrdersRecordData(
                                userId: currentUserReference,
                                aid: widget.address!.reference,
                                pid: widget.proid!.reference,
                                quantity: _model.countControllerValue,
                                itemName: widget.proid!.itemMaster,
                                mrp: getJsonField(
                                  widget.psql,
                                  r'''$..mrp''',
                                ),
                                rate: getJsonField(
                                  widget.psql,
                                  r'''$..rate''',
                                ),
                                orderTime: getCurrentTimestamp,
                                photoOnList: widget.proid!.photoOnList,
                                subtotal: functions
                                    .defaultcd(
                                        getJsonField(
                                          widget.psql,
                                          r'''$..rate''',
                                        ),
                                        getJsonField(
                                          widget.psql,
                                          r'''$..default_cd''',
                                        ))
                                    .toDouble(),
                                disc: getJsonField(
                                  widget.psql,
                                  r'''$..default_cd''',
                                ),
                                orderDetails: _model.oederDetails!.reference,
                                sQLId: widget.proid!.sQLId,
                              ));
                          await CreateOrderCall.call(
                            userId: currentUserUid,
                            itemId: widget.proid!.sQLId,
                            quantity: _model.countControllerValue,
                            itemName: widget.proid!.itemMaster,
                            mrp: getJsonField(
                              widget.psql,
                              r'''$..mrp''',
                            ),
                            rate: getJsonField(
                              widget.psql,
                              r'''$..rate''',
                            ),
                            defaultCd: getJsonField(
                              widget.psql,
                              r'''$..default_cd''',
                            ),
                            subtotal: functions
                                .defaultcd(
                                    getJsonField(
                                      widget.psql,
                                      r'''$..rate''',
                                    ),
                                    getJsonField(
                                      widget.psql,
                                      r'''$..default_cd''',
                                    ))
                                .toDouble(),
                            orderStatus: 'Order Placed',
                            deliveryCharge: 0.0,
                            isOrdered: true,
                            orderTime: getCurrentTimestamp.toString(),
                            stype: 'CreateOrder',
                          );
                          triggerPushNotification(
                            notificationTitle: 'Order Placed !!',
                            notificationText:
                                'Your order${widget.proid!.itemMaster}has been placed.And we will notify the updates soon.',
                            notificationImageUrl: widget.proid!.photoOnList,
                            notificationSound: 'default',
                            userRefs: [currentUserReference!],
                            initialPageName: 'MyOrders',
                            parameterData: {},
                          );
                          triggerPushNotification(
                            notificationTitle: 'New Order Is Placed !!',
                            notificationText:
                                'New  order has been placed of ${widget.proid!.itemMaster} . Please go and check it out',
                            notificationImageUrl: widget.proid!.photoOnList,
                            notificationSound: 'default',
                            userRefs: bottomButtonAreaViratUserRecordList
                                .map((e) => e.reference)
                                .toList(),
                            initialPageName: 'MyOrders',
                            parameterData: {},
                          );
                          await Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: SucessPageWidget(),
                            ),
                            (r) => false,
                          );

                          setState(() {});
                        },
                        text: 'Place Order',
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
                                color: FlutterFlowTheme.of(context).primaryText,
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
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
