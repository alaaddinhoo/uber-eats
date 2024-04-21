import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'auth_confirm_code_widget.dart' show AuthConfirmCodeWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthConfirmCodeModel extends FlutterFlowModel<AuthConfirmCodeWidget> {
  ///  Local state fields for this page.

  bool disabledResend = true;

  int? counter = 8;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? userDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? toUpdate;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    pinCodeController?.dispose();
  }
}
