import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_confirm_code_model.dart';
export 'auth_confirm_code_model.dart';

class AuthConfirmCodeWidget extends StatefulWidget {
  const AuthConfirmCodeWidget({
    super.key,
    required this.number,
    required this.email,
    required this.password,
  });

  final String? number;
  final String? email;
  final String? password;

  @override
  State<AuthConfirmCodeWidget> createState() => _AuthConfirmCodeWidgetState();
}

class _AuthConfirmCodeWidgetState extends State<AuthConfirmCodeWidget> {
  late AuthConfirmCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthConfirmCodeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (_model.counter == 0) {
            setState(() {
              _model.disabledResend = false;
            });
            _model.instantTimer?.cancel();
          } else {
            setState(() {
              _model.counter = _model.counter! + -1;
            });
          }
        },
        startImmediately: true,
      );
    });

    authManager.handlePhoneAuthStateChanges(context);
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
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Text(
                          'Enter the 6-digit code sent to you at ${widget.number}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Uber Move ',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  decoration: BoxDecoration(),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: 'Uber Move ',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      enableActiveFill: false,
                      autoFocus: true,
                      enablePinAutofill: false,
                      errorTextSpace: 16.0,
                      showCursor: true,
                      cursorColor: Colors.black,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 44.0,
                        fieldWidth: 44.0,
                        borderWidth: 2.0,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        shape: PinCodeFieldShape.box,
                        inactiveColor: FlutterFlowTheme.of(context).alternate,
                        selectedColor: Colors.black,
                        inactiveFillColor:
                            FlutterFlowTheme.of(context).alternate,
                        selectedFillColor: Colors.black,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) {},
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: _model.pinCodeControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: (_model.disabledResend == true)
                      ? null
                      : () async {
                          if (_model.disabledResend == false) {
                            final phoneNumberVal = widget.number;
                            if (phoneNumberVal == null ||
                                phoneNumberVal.isEmpty ||
                                !phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              return;
                            }
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                context.goNamedAuth(
                                  'AuthConfirmCode',
                                  context.mounted,
                                  queryParameters: {
                                    'number': serializeParam(
                                      widget.number,
                                      ParamType.String,
                                    ),
                                    'email': serializeParam(
                                      '',
                                      ParamType.String,
                                    ),
                                    'password': serializeParam(
                                      '',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          }
                        },
                  text:
                      'I haven\'t received a code (00:${_model.counter?.toString()})',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFEEEEEE),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Uber Move ',
                          color: Color(0xFF5A5A5A),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(50.0),
                    disabledColor: Color(0x86EEEEEE),
                    disabledTextColor: Color(0x7B5A5A5A),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Color(0xFFEEEEEE),
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0xFFEEEEEE),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            final smsCodeVal = _model.pinCodeController!.text;
                            if (smsCodeVal == null || smsCodeVal.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Enter SMS verification code.'),
                                ),
                              );
                              return;
                            }
                            final phoneVerifiedUser =
                                await authManager.verifySmsCode(
                              context: context,
                              smsCode: smsCodeVal,
                            );
                            if (phoneVerifiedUser == null) {
                              return;
                            }

                            _model.userDoc = await queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                'phone_number',
                                isEqualTo: widget.number,
                              ),
                            );
                            if (widget.email != null && widget.email != '') {
                              await authManager.deleteUser(context);
                              await _model.userDoc!.first.reference.delete();
                              _model.toUpdate = await queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'email',
                                  isEqualTo: widget.email,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.toUpdate!.reference
                                  .update(createUsersRecordData(
                                phoneNumber: widget.number,
                              ));
                              GoRouter.of(context).prepareAuthEvent();

                              final user = await authManager.signInWithEmail(
                                context,
                                widget.email!,
                                widget.password!,
                              );
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth(
                                  'HomeScreen', context.mounted);
                            } else {
                              if (_model.userDoc!.first.hasDisplayName()) {
                                context.pushNamedAuth(
                                    'HomeScreen', context.mounted);
                              } else {
                                context.pushNamedAuth(
                                  'AuthCompleteProfileName',
                                  context.mounted,
                                  queryParameters: {
                                    'email': serializeParam(
                                      '',
                                      ParamType.String,
                                    ),
                                    'password': serializeParam(
                                      '',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            }

                            setState(() {});
                          },
                          text: 'Next',
                          options: FFButtonOptions(
                            width: 80.0,
                            height: 40.0,
                            padding: EdgeInsets.all(0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFEEEEEE),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Uber Move ',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ],
                    ),
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
