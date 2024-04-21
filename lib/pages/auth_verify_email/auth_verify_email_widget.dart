import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_verify_email_model.dart';
export 'auth_verify_email_model.dart';

class AuthVerifyEmailWidget extends StatefulWidget {
  const AuthVerifyEmailWidget({
    super.key,
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  @override
  State<AuthVerifyEmailWidget> createState() => _AuthVerifyEmailWidgetState();
}

class _AuthVerifyEmailWidgetState extends State<AuthVerifyEmailWidget> {
  late AuthVerifyEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthVerifyEmailModel());

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Confirm your email',
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
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Text(
                              'An email verification link has been sent to ${widget.email}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Uber Move ',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          if (_model.error == true)
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFCAEA1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          'You have not verified your email. Please, check your inbox or junk to confirm your account.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              ),
                            ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await authManager.refreshUser();
                                while (_model.counter! < 2) {
                                  setState(() {
                                    _model.error = false;
                                  });
                                  await Future.delayed(
                                      const Duration(milliseconds: 2000));
                                  if (currentUserEmailVerified == true) {
                                    if (currentUserDisplayName == null ||
                                        currentUserDisplayName == '') {
                                      context.pushNamed(
                                        'AuthCompleteProfileName',
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

                                      break;
                                    }
                                  }
                                  setState(() {
                                    _model.counter = _model.counter! + 1;
                                  });
                                }
                                await Future.delayed(
                                    const Duration(milliseconds: 1000));
                                setState(() {
                                  _model.error = true;
                                });
                              },
                              text: 'Done',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 45.0,
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
                          ),
                        ],
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await authManager.sendEmailVerification();
                          setState(() {
                            _model.error = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Confirmation email has been resent',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 3000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

                          context.pushNamed(
                            'AuthVerifyEmail',
                            queryParameters: {
                              'email': serializeParam(
                                widget.email,
                                ParamType.String,
                              ),
                              'password': serializeParam(
                                '',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  'Did not get an email? Resend email',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Uber Move ',
                                        color: Color(0xFF888888),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                        lineHeight: 1.3,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
