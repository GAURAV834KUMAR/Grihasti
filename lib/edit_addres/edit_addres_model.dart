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

class EditAddresModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Mobile_No widget.
  TextEditingController? mobileNoController;
  String? Function(BuildContext, String?)? mobileNoControllerValidator;
  // State field(s) for Pin_Code widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Addres widget.
  TextEditingController? addresController;
  String? Function(BuildContext, String?)? addresControllerValidator;
  // State field(s) for Area widget.
  TextEditingController? areaController;
  String? Function(BuildContext, String?)? areaControllerValidator;
  // State field(s) for Landmark widget.
  TextEditingController? landmarkController;
  String? Function(BuildContext, String?)? landmarkControllerValidator;
  // State field(s) for Town widget.
  TextEditingController? townController;
  String? Function(BuildContext, String?)? townControllerValidator;
  // State field(s) for State widget.
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;
  // State field(s) for District widget.
  TextEditingController? districtController;
  String? Function(BuildContext, String?)? districtControllerValidator;
  // State field(s) for Country widget.
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    mobileNoController?.dispose();
    pinCodeController?.dispose();
    addresController?.dispose();
    areaController?.dispose();
    landmarkController?.dispose();
    townController?.dispose();
    stateController?.dispose();
    districtController?.dispose();
    countryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
