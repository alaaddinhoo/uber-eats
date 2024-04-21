import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_complete_profile_name_model.dart';
export 'auth_complete_profile_name_model.dart';

class AuthCompleteProfileNameWidget extends StatefulWidget {
  const AuthCompleteProfileNameWidget({
    super.key,
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  @override
  State<AuthCompleteProfileNameWidget> createState() =>
      _AuthCompleteProfileNameWidgetState();
}

class _AuthCompleteProfileNameWidgetState
    extends State<AuthCompleteProfileNameWidget> {
  late AuthCompleteProfileNameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthCompleteProfileNameModel());

    _model.fnameTextController ??= TextEditingController();
    _model.fnameFocusNode ??= FocusNode();

    _model.lnameTextController ??= TextEditingController();
    _model.lnameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Complete your Profile',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.fnameTextController,
                                        focusNode: _model.fnameFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'First Name',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFEEEEEE),
                                          contentPadding: EdgeInsets.all(24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Uber Move ',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .fnameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.lnameTextController,
                                        focusNode: _model.lnameFocusNode,
                                        autofocus: false,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Last Name',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFEEEEEE),
                                          contentPadding: EdgeInsets.all(24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Uber Move ',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        validator: _model
                                            .lnameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      displayName:
                                          '${_model.fnameTextController.text} ${_model.lnameTextController.text}',
                                    ));
                                    if (currentPhoneNumber != null &&
                                        currentPhoneNumber != '') {
                                      context.pushNamed('HomeScreen');
                                    } else {
                                      context.goNamed(
                                        'AuthCompleteProfilePhone',
                                        queryParameters: {
                                          'email': serializeParam(
                                            widget.email,
                                            ParamType.String,
                                          ),
                                          'password': serializeParam(
                                            widget.password,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  },
                                  text: 'Next',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.black,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 30.0)),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
