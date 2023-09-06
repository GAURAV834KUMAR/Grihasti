import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/cartshow_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quantity_model.dart';
export 'quantity_model.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    Key? key,
    this.cartid,
    this.psql,
  }) : super(key: key);

  final ProductMasterRecord? cartid;
  final dynamic psql;

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  late QuantityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuantityModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OrderDetailsRecord>>(
      stream: queryOrderDetailsRecord(
        queryBuilder: (orderDetailsRecord) => orderDetailsRecord
            .where('UserId', isEqualTo: currentUserReference)
            .where('Is_Order', isEqualTo: false),
        singleRecord: true,
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
        List<OrderDetailsRecord> columnOrderDetailsRecordList = snapshot.data!;
        final columnOrderDetailsRecord = columnOrderDetailsRecordList.isNotEmpty
            ? columnOrderDetailsRecordList.first
            : null;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Select The Quantity',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
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
                          color: Colors.black,
                          size: 30.0,
                        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                    child: Image.network(
                      widget.cartid!.photoOnList,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 0.0, 0.0),
                          child: Text(
                            widget.cartid!.itemMaster,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 0.0, 0.0),
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
                                  color: Colors.red,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Color(0xFF9E9E9E),
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? Color(0xDD000000)
                                      : Color(0xFFEEEEEE),
                                  size: 18.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color:
                                      enabled ? Colors.blue : Color(0xFFEEEEEE),
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
                                count: _model.countControllerValue ??= 1,
                                updateCount: (count) => setState(
                                    () => _model.countControllerValue = count),
                                stepSize: 1,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
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
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var ordersRecordReference = OrdersRecord.collection.doc();
                  await ordersRecordReference.set(createOrdersRecordData(
                    userId: currentUserReference,
                    pid: widget.cartid!.reference,
                    itemName: widget.cartid!.itemMaster,
                    mrp: getJsonField(
                      widget.psql,
                      r'''$..mrp''',
                    ),
                    rate: getJsonField(
                      widget.psql,
                      r'''$..rate''',
                    ),
                    photoOnList: widget.cartid!.photoOnList,
                    subtotal: functions
                        .quantityrate(
                            functions.defaultcd(
                                getJsonField(
                                  widget.psql,
                                  r'''$..rate''',
                                ),
                                getJsonField(
                                  widget.psql,
                                  r'''$..default_cd''',
                                )),
                            _model.countControllerValue)
                        .toDouble(),
                    disc: getJsonField(
                      widget.psql,
                      r'''$..default_cd''',
                    ),
                    quantity: _model.countControllerValue,
                    orderDetails: columnOrderDetailsRecord!.reference,
                    orderTime: getCurrentTimestamp,
                    sQLId: widget.cartid!.sQLId,
                  ));
                  _model.orderid = OrdersRecord.getDocumentFromData(
                      createOrdersRecordData(
                        userId: currentUserReference,
                        pid: widget.cartid!.reference,
                        itemName: widget.cartid!.itemMaster,
                        mrp: getJsonField(
                          widget.psql,
                          r'''$..mrp''',
                        ),
                        rate: getJsonField(
                          widget.psql,
                          r'''$..rate''',
                        ),
                        photoOnList: widget.cartid!.photoOnList,
                        subtotal: functions
                            .quantityrate(
                                functions.defaultcd(
                                    getJsonField(
                                      widget.psql,
                                      r'''$..rate''',
                                    ),
                                    getJsonField(
                                      widget.psql,
                                      r'''$..default_cd''',
                                    )),
                                _model.countControllerValue)
                            .toDouble(),
                        disc: getJsonField(
                          widget.psql,
                          r'''$..default_cd''',
                        ),
                        quantity: _model.countControllerValue,
                        orderDetails: columnOrderDetailsRecord!.reference,
                        orderTime: getCurrentTimestamp,
                        sQLId: widget.cartid!.sQLId,
                      ),
                      ordersRecordReference);
                  _model.order = await CreateOrderCall.call(
                    stype: 'CreateOrder',
                    itemId: widget.cartid!.sQLId,
                    quantity: _model.countControllerValue,
                    itemName: widget.cartid!.itemMaster,
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
                        .quantityrate(
                            functions.defaultcd(
                                getJsonField(
                                  widget.psql,
                                  r'''$..rate''',
                                ),
                                getJsonField(
                                  widget.psql,
                                  r'''$..default_cd''',
                                )),
                            _model.countControllerValue)
                        .toDouble(),
                    orderStatus: 'Not Placed',
                    deliveryCharge: 0.0,
                    isOrdered: false,
                    orderTime: getCurrentTimestamp.toString(),
                    userId: currentUserUid,
                  );
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    barrierColor: Color(0x00000000),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: CartshowWidget(
                            cartid: widget.cartid,
                            psql: widget.psql,
                          ),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));

                  setState(() {});
                },
                text: 'Add To Cart',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
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
        );
      },
    );
  }
}
