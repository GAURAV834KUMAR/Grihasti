import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/delivery_address/delivery_address_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/product_details/product_details_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cartshow_model.dart';
export 'cartshow_model.dart';

class CartshowWidget extends StatefulWidget {
  const CartshowWidget({
    Key? key,
    this.cartid,
    this.psql,
  }) : super(key: key);

  final ProductMasterRecord? cartid;
  final dynamic psql;

  @override
  _CartshowWidgetState createState() => _CartshowWidgetState();
}

class _CartshowWidgetState extends State<CartshowWidget> {
  late CartshowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartshowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.05, -1.0),
      child: SingleChildScrollView(
        child: Column(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Done',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Image.network(
                              widget.cartid!.photoOnList,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.done,
                              color: FlutterFlowTheme.of(context).delivery2,
                              size: 26.0,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Added to cart',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .delivery2,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  widget.cartid!.itemMaster,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: NavBarPage(initialPage: 'Cart'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Cart',
                              options: FFButtonOptions(
                                width: 120.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 10.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration:
                                        Duration(milliseconds: 300),
                                    child: DeliveryAddressWidget(
                                      proid: widget.cartid,
                                      psql: widget.psql,
                                    ),
                                  ),
                                );
                              },
                              text: 'Proceed to checkout',
                              options: FFButtonOptions(
                                width: 210.0,
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 2.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: StreamBuilder<List<ProductMasterRecord>>(
                        stream: queryProductMasterRecord(
                          queryBuilder: (productMasterRecord) =>
                              productMasterRecord
                                  .where('Catagorey_name',
                                      isEqualTo: widget.cartid!.catagoreyName)
                                  .orderBy('Adding_Time', descending: true),
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
                          List<ProductMasterRecord>
                              listViewProductMasterRecordList = snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewProductMasterRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewProductMasterRecord =
                                  listViewProductMasterRecordList[
                                      listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 5.0, 16.0, 8.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: ProductListCall.call(
                                    stype: 'ProductList',
                                    id: listViewProductMasterRecord.sQLId,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitDoubleBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final menuItemProductListResponse =
                                        snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
                                            child: ProductDetailsWidget(
                                              prid: listViewProductMasterRecord,
                                              psql: menuItemProductListResponse
                                                  .jsonBody,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x411D2429),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 1.0, 1.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewProductMasterRecord
                                                          .photoOnList,
                                                      'https://cdn-icons-png.flaticon.com/512/401/401061.png',
                                                    ),
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 4.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        listViewProductMasterRecord
                                                            .itemMaster,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF0F1113),
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          listViewProductMasterRecord
                                                              .brandName
                                                              .maybeHandleOverflow(
                                                            maxChars: 70,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Color(0xFF57636C),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (functions.mrpequalrate(
                                                              getJsonField(
                                                                menuItemProductListResponse
                                                                    .jsonBody,
                                                                r'''$..mrp''',
                                                              ),
                                                              functions
                                                                  .defaultcd(
                                                                      getJsonField(
                                                                        menuItemProductListResponse
                                                                            .jsonBody,
                                                                        r'''$..rate''',
                                                                      ),
                                                                      getJsonField(
                                                                        menuItemProductListResponse
                                                                            .jsonBody,
                                                                        r'''$..default_cd''',
                                                                      ))
                                                                  .toDouble()) ==
                                                          true)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      4.0,
                                                                      8.0),
                                                          child: Text(
                                                            '₹${getJsonField(
                                                              menuItemProductListResponse
                                                                  .jsonBody,
                                                              r'''$..mrp''',
                                                            ).toString()}',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    4.0,
                                                                    8.0),
                                                        child: Text(
                                                          formatNumber(
                                                            functions.defaultcd(
                                                                getJsonField(
                                                                  menuItemProductListResponse
                                                                      .jsonBody,
                                                                  r'''$..rate''',
                                                                ),
                                                                getJsonField(
                                                                  menuItemProductListResponse
                                                                      .jsonBody,
                                                                  r'''$..default_cd''',
                                                                )),
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            format: '₹ ##,###',
                                                            locale: '',
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF0F1113),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
            ),
          ],
        ),
      ),
    );
  }
}
