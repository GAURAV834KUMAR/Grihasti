import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'delivery_info_model.dart';
export 'delivery_info_model.dart';

class DeliveryInfoWidget extends StatefulWidget {
  const DeliveryInfoWidget({Key? key}) : super(key: key);

  @override
  _DeliveryInfoWidgetState createState() => _DeliveryInfoWidgetState();
}

class _DeliveryInfoWidgetState extends State<DeliveryInfoWidget> {
  late DeliveryInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeliveryInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AdressRecord>>(
      stream: queryAdressRecord(
        queryBuilder: (adressRecord) => adressRecord
            .where('userid', isEqualTo: currentUserReference)
            .orderBy('Default_Add', descending: true),
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
        List<AdressRecord> listViewAdressRecordList = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: listViewAdressRecordList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewAdressRecord =
                listViewAdressRecordList[listViewIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                    reverseDuration: Duration(milliseconds: 0),
                    child: NavBarPage(initialPage: 'HomePage2'),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFFF5F5F5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        listViewAdressRecord.name,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 16.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        listViewAdressRecord.adress,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        listViewAdressRecord.area,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        listViewAdressRecord.landmark,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 0.0),
                          child: Text(
                            listViewAdressRecord.townCityName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            ',',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 10.0, 0.0),
                          child: Text(
                            listViewAdressRecord.pINCode.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 0.0),
                          child: Text(
                            listViewAdressRecord.district,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            ',',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 10.0, 0.0),
                          child: Text(
                            listViewAdressRecord.state,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    if (listViewAdressRecord.defaultAdd == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 10.0),
                        child: Text(
                          'Default Address',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
