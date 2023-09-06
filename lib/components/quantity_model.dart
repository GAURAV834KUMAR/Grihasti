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

class QuantityModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? orderid;
  // Stores action output result for [Backend Call - API (CreateOrder)] action in Button widget.
  ApiCallResponse? order;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
