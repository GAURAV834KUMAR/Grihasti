import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_phone_no_model.dart';
export 'verify_phone_no_model.dart';

class VerifyPhoneNoWidget extends StatefulWidget {
  const VerifyPhoneNoWidget({Key? key}) : super(key: key);

  @override
  _VerifyPhoneNoWidgetState createState() => _VerifyPhoneNoWidgetState();
}

class _VerifyPhoneNoWidgetState extends State<VerifyPhoneNoWidget> {
  late VerifyPhoneNoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyPhoneNoModel());

    _model.verificationcodeController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xFF0F1113),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Back',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Verify Phone',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF0F1113),
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                    child: Text(
                      'We will send you an SMS on your mentioned mobile no. with a 6-digit verification code , please enter the cade below.',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                  child: Text(
                    FFAppState().phoneno.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF57636C),
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x4D101213),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextFormField(
                controller: _model.verificationcodeController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Your Otp...',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                  hintText: 'Enter Otp Here...',
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF57636C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF0F1113),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                validator: _model.verificationcodeControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                final smsCodeVal = _model.verificationcodeController.text;
                if (smsCodeVal == null || smsCodeVal.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Enter SMS verification code.'),
                    ),
                  );
                  return;
                }
                final phoneVerifiedUser = await authManager.verifySmsCode(
                  context: context,
                  smsCode: smsCodeVal,
                );
                if (phoneVerifiedUser == null) {
                  return;
                }

                await currentUserReference!.update(createViratUserRecordData(
                  isAdmin: 'false',
                  gender: 'Nothing',
                ));
                triggerPushNotification(
                  notificationTitle: 'WELCOME !!',
                  notificationText:
                      'Welcome to our Virat family. We are glade to see you here. For any query contact to @8789779449',
                  notificationImageUrl:
                      'https://img.freepik.com/premium-vector/welcome-big-word-text_25147-50.jpg?w=1060',
                  notificationSound: 'default',
                  userRefs: [currentUserReference!],
                  initialPageName: 'HomePage2',
                  parameterData: {},
                );
                triggerPushNotification(
                  notificationTitle: 'Add Profile information',
                  notificationText: 'Please add your profile informations',
                  notificationSound: 'default',
                  userRefs: [currentUserReference!],
                  initialPageName: 'RegisterUser',
                  parameterData: {},
                );
                await Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 300),
                    reverseDuration: Duration(milliseconds: 300),
                    child: NavBarPage(initialPage: 'HomePage2'),
                  ),
                  (r) => false,
                );
              },
              text: 'Submit OTP',
              options: FFButtonOptions(
                width: 270.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF0F1113),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 3.0,
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
    );
  }
}
