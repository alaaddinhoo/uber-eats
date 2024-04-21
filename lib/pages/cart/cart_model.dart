import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  int? index = 0;

  bool clearedCart = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Stripe Payment] action in Row widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
