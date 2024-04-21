import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'auth_complete_profile_phone_widget.dart'
    show AuthCompleteProfilePhoneWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AuthCompleteProfilePhoneModel
    extends FlutterFlowModel<AuthCompleteProfilePhoneWidget> {
  ///  Local state fields for this page.

  String country = 'US';

  List<dynamic> countryList = [];
  void addToCountryList(dynamic item) => countryList.add(item);
  void removeFromCountryList(dynamic item) => countryList.remove(item);
  void removeAtIndexFromCountryList(int index) => countryList.removeAt(index);
  void insertAtIndexInCountryList(int index, dynamic item) =>
      countryList.insert(index, item);
  void updateCountryListAtIndex(int index, Function(dynamic) updateFn) =>
      countryList[index] = updateFn(countryList[index]);

  bool popupOpen = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
