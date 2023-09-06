import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'starting_page_model.dart';
export 'starting_page_model.dart';

class StartingPageWidget extends StatefulWidget {
  const StartingPageWidget({Key? key}) : super(key: key);

  @override
  _StartingPageWidgetState createState() => _StartingPageWidgetState();
}

class _StartingPageWidgetState extends State<StartingPageWidget> {
  late StartingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartingPageModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 44.0, 16.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22.0),
                  child: Image.asset(
                    'assets/images/shoopint-ads.png',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: SelectionArea(
                    child: Text(
                  'Get Ready\nTo Shop',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Titan One',
                        color: Color(0xFF0E1444),
                        fontSize: 48.0,
                        fontWeight: FontWeight.w500,
                      ),
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                child: SelectionArea(
                    child: Text(
                  'We’ll take care of the grocery bags.',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x73101213),
                      ),
                )),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: LoginWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: Container(
                      width: 245.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE7E5FD),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: SelectionArea(
                                child: Text(
                              'Let me start exploring!',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF0E1444),
                                    fontWeight: FontWeight.w600,
                                  ),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: BorderRadius.circular(23.0),
                              ),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Color(0xFF0E1444),
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
