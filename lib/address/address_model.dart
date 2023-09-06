import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/your_address/your_address_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre a name...';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for Mobile_No widget.
  TextEditingController? mobileNoController;
  String? Function(BuildContext, String?)? mobileNoControllerValidator;
  String? _mobileNoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre a Phone Number so we can call if there are any issues with delivery....';
    }

    return null;
  }

  // State field(s) for Pin_Code widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre a ZIP or postal code...';
    }

    return null;
  }

  // State field(s) for Addres widget.
  TextEditingController? addresController;
  String? Function(BuildContext, String?)? addresControllerValidator;
  String? _addresControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre an address...';
    }

    return null;
  }

  // State field(s) for Area widget.
  TextEditingController? areaController;
  String? Function(BuildContext, String?)? areaControllerValidator;
  // State field(s) for Landmark widget.
  TextEditingController? landmarkController;
  String? Function(BuildContext, String?)? landmarkControllerValidator;
  // State field(s) for Town widget.
  TextEditingController? townController;
  String? Function(BuildContext, String?)? townControllerValidator;
  String? _townControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre a City name...';
    }

    return null;
  }

  // State field(s) for District widget.
  TextEditingController? districtController;
  String? Function(BuildContext, String?)? districtControllerValidator;
  String? _districtControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre the District name...';
    }

    return null;
  }

  // State field(s) for State widget.
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;
  String? _stateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre the State Name...';
    }

    return null;
  }

  // State field(s) for Country widget.
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  String? _countryControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please entre the Country name...';
    }

    return null;
  }

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    mobileNoControllerValidator = _mobileNoControllerValidator;
    pinCodeControllerValidator = _pinCodeControllerValidator;
    addresControllerValidator = _addresControllerValidator;
    townControllerValidator = _townControllerValidator;
    districtControllerValidator = _districtControllerValidator;
    stateControllerValidator = _stateControllerValidator;
    countryControllerValidator = _countryControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    mobileNoController?.dispose();
    pinCodeController?.dispose();
    addresController?.dispose();
    areaController?.dispose();
    landmarkController?.dispose();
    townController?.dispose();
    districtController?.dispose();
    stateController?.dispose();
    countryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
