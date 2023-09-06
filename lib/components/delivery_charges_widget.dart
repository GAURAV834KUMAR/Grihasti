import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/order_history/order_history_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delivery_charges_model.dart';
export 'delivery_charges_model.dart';

class DeliveryChargesWidget extends StatefulWidget {
  const DeliveryChargesWidget({
    Key? key,
    this.odid,
  }) : super(key: key);

  final OrderDetailsRecord? odid;

  @override
  _DeliveryChargesWidgetState createState() => _DeliveryChargesWidgetState();
}

class _DeliveryChargesWidgetState extends State<DeliveryChargesWidget> {
  late DeliveryChargesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryChargesModel());

    _model.textController ??= TextEditingController();
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
        Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            border: Border.all(
              color: FlutterFlowTheme.of(context).secondaryText,
              width: 0.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Delivery Charges',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend Deca',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.75, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 0.0),
          child: TextFormField(
            controller: _model.textController,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.textController',
              Duration(milliseconds: 2000),
              () => setState(() {}),
            ),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Delivery Charges',
              hintText: 'Delivery Charges',
              hintStyle: FlutterFlowTheme.of(context).bodySmall,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
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
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              suffixIcon: _model.textController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () async {
                        _model.textController?.clear();
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
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
            keyboardType: TextInputType.number,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.odid!.reference
                        .update(createOrderDetailsRecordData(
                      deliveryCharges: 0.0,
                      subtotal: widget.odid!.subtotal,
                      deliveryCharFree: true,
                      isDeliveryCharge: true,
                    ));
                    triggerPushNotification(
                      notificationTitle: 'Delivery Charges !!',
                      notificationText:
                          'Your delivery charges are ₹ 0 and the total payable amount is ${formatNumber(
                        functions.subtotal(widget.odid!.subtotal, 0.0),
                        formatType: FormatType.custom,
                        format: '₹ ##,###',
                        locale: '',
                      )} . For more details click here',
                      notificationSound: 'default',
                      userRefs: [widget.odid!.userId!],
                      initialPageName: 'MyOrdersDetails',
                      parameterData: {
                        'odid': widget.odid,
                      },
                    );
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: OrderHistoryWidget(),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Free',
                  options: FFButtonOptions(
                    width: 150.0,
                    height: 45.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF04EA04),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.odid!.reference
                        .update(createOrderDetailsRecordData(
                      deliveryCharges:
                          double.tryParse(_model.textController.text),
                      subtotal: widget.odid!.subtotal,
                      deliveryCharFree: false,
                      isDeliveryCharge: true,
                    ));
                    triggerPushNotification(
                      notificationTitle: 'Delivery Charges !!',
                      notificationText:
                          'Your delivery charges are ${_model.textController.text} and the total payable amount is ${formatNumber(
                        functions.subtotal(widget.odid!.subtotal,
                            double.tryParse(_model.textController.text)),
                        formatType: FormatType.custom,
                        format: '₹ ##,###',
                        locale: '',
                      )} . For more details click here',
                      notificationSound: 'default',
                      userRefs: [widget.odid!.userId!],
                      initialPageName: 'MyOrdersDetails',
                      parameterData: {
                        'odid': widget.odid,
                      },
                    );
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: OrderHistoryWidget(),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    width: 150.0,
                    height: 45.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
