import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'auth_main_model.dart';
export 'auth_main_model.dart';

class AuthMainWidget extends StatefulWidget {
  const AuthMainWidget({super.key});

  @override
  State<AuthMainWidget> createState() => _AuthMainWidgetState();
}

class _AuthMainWidgetState extends State<AuthMainWidget> {
  late AuthMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthMainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.countryList = functions.countryList().toList().cast<dynamic>();
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your mobile number',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Uber Move ',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.popupOpen = true;
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      'https://flagcdn.com/w40/${functions.lowerCaseLetters(_model.country)}.png',
                                      width: 30.0,
                                      height: 50.0,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: Stack(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          55.0, 0.0, 10.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          hintText: 'Mobile Number',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Uber Move ',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        functions
                                            .filterJson(
                                                'code',
                                                '==',
                                                _model.country,
                                                functions
                                                    .countryList()
                                                    .toList())!
                                            .first,
                                        r'''$.dial_code''',
                                      )
                                          .toString()
                                          .maybeHandleOverflow(maxChars: 5),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Uber Move ',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
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
                                    final phoneNumberVal = '${getJsonField(
                                      functions
                                          .filterJson(
                                              'code',
                                              '==',
                                              _model.country,
                                              functions.countryList().toList())
                                          ?.first,
                                      r'''$.dial_code''',
                                    ).toString()}${_model.textController1.text}';
                                    if (phoneNumberVal == null ||
                                        phoneNumberVal.isEmpty ||
                                        !phoneNumberVal.startsWith('+')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                              '${getJsonField(
                                                functions
                                                    .filterJson(
                                                        'code',
                                                        '==',
                                                        _model.country,
                                                        functions
                                                            .countryList()
                                                            .toList())
                                                    ?.first,
                                                r'''$.dial_code''',
                                              ).toString()}${_model.textController1.text}',
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
                                  },
                                  text: 'Next',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 40.0,
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
                      Text(
                        'By proceeding, you consent to get calls, Whatsapp or SMS messages, including by automated means, from uber and its affiliates to the number provided.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Uber Move ',
                              color: Color(0xFF888888),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                              lineHeight: 1.3,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                          ),
                          Text(
                            'or',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Uber Move ',
                                  color: Color(0xFF888888),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('AuthEmailLogin');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          color: Color(0xFF5A5A5A),
                                          size: 20.0,
                                        ),
                                        Text(
                                          'Continue with Email',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.facebookSquare,
                                        color: Color(0xFF305089),
                                        size: 22.0,
                                      ),
                                      Text(
                                        'Continue with Facebook',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Uber Move ',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
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
                              GoRouter.of(context).prepareAuthEvent();
                              final user =
                                  await authManager.signInWithGoogle(context);
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth(
                                  'HomeScreen', context.mounted);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/icons8-google-48.png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          'Continue with Google',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Stack(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          final user = await authManager
                                              .signInWithGoogle(context);
                                          if (user == null) {
                                            return;
                                          }

                                          context.goNamedAuth(
                                              'HomeScreen', context.mounted);
                                        },
                                        text: 'Continue with Google',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 50.0,
                                          padding: EdgeInsets.all(0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFEEEEEE),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            70.0, 0.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/icons8-google-48.png',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ].divide(SizedBox(height: 25.0)),
                  ),
                ),
              ),
              if (_model.popupOpen)
                Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.popupOpen = false;
                            });
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: Color(0x67000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 0.0, 25.0, 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.search,
                                        color: Colors.black,
                                        size: 18.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController2',
                                              Duration(milliseconds: 0),
                                              () async {
                                                if (_model.textController2
                                                            .text !=
                                                        null &&
                                                    _model.textController2
                                                            .text !=
                                                        '') {
                                                  safeSetState(() {
                                                    _model.simpleSearchResults =
                                                        TextSearch(functions
                                                                .decodeJSON(_model
                                                                    .countryList
                                                                    .toList())!
                                                                .map((str) => TextSearchItem
                                                                    .fromTerms(
                                                                        str,
                                                                        [str]))
                                                                .toList())
                                                            .search(_model
                                                                .textController2
                                                                .text)
                                                            .map(
                                                                (r) => r.object)
                                                            .toList();
                                                    ;
                                                  });
                                                  if (_model.simpleSearchResults
                                                          .length >
                                                      0) {
                                                    setState(() {
                                                      _model.countryList = functions
                                                          .filterJSONData(
                                                              _model.countryList
                                                                  .toList(),
                                                              _model
                                                                  .simpleSearchResults
                                                                  .toList(),
                                                              'name')!
                                                          .toList()
                                                          .cast<dynamic>();
                                                    });
                                                  }
                                                } else {
                                                  setState(() {
                                                    _model.countryList =
                                                        functions
                                                            .countryList()
                                                            .toList()
                                                            .cast<dynamic>();
                                                  });
                                                }
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Uber Move ',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              hintText: 'Search Country',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Uber Move ',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                              suffixIcon: _model
                                                      .textController2!
                                                      .text
                                                      .isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model.textController2
                                                            ?.clear();
                                                        if (_model.textController2
                                                                    .text !=
                                                                null &&
                                                            _model.textController2
                                                                    .text !=
                                                                '') {
                                                          safeSetState(() {
                                                            _model
                                                                .simpleSearchResults = TextSearch(functions
                                                                    .decodeJSON(_model
                                                                        .countryList
                                                                        .toList())!
                                                                    .map((str) =>
                                                                        TextSearchItem.fromTerms(
                                                                            str,
                                                                            [
                                                                              str
                                                                            ]))
                                                                    .toList())
                                                                .search(_model
                                                                    .textController2
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList();
                                                            ;
                                                          });
                                                          if (_model
                                                                  .simpleSearchResults
                                                                  .length >
                                                              0) {
                                                            setState(() {
                                                              _model.countryList = functions
                                                                  .filterJSONData(
                                                                      _model
                                                                          .countryList
                                                                          .toList(),
                                                                      _model
                                                                          .simpleSearchResults
                                                                          .toList(),
                                                                      'name')!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                            });
                                                          }
                                                        } else {
                                                          setState(() {
                                                            _model.countryList =
                                                                functions
                                                                    .countryList()
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                          });
                                                        }

                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.clear,
                                                        size: 22,
                                                      ),
                                                    )
                                                  : null,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Uber Move ',
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_model.countryList.length > 0)
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final countryItem =
                                              _model.countryList.toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: countryItem.length,
                                            itemBuilder:
                                                (context, countryItemIndex) {
                                              final countryItemItem =
                                                  countryItem[countryItemIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.country =
                                                        functions.jsonToString(
                                                            getJsonField(
                                                      countryItemItem,
                                                      r'''$.code''',
                                                    ))!;
                                                  });
                                                  setState(() {
                                                    _model.popupOpen = false;
                                                  });
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        functions.jsonToString(
                                                                    getJsonField(
                                                                  countryItemItem,
                                                                  r'''$.code''',
                                                                )) ==
                                                                _model.country
                                                            ? Color(0xFFF4F4F4)
                                                            : Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://flagcdn.com/w40/${functions.lowerCaseLetters(getJsonField(
                                                              countryItemItem,
                                                              r'''$.code''',
                                                            ).toString())}.png',
                                                            width: 30.0,
                                                            height: 50.0,
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              getJsonField(
                                                                countryItemItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Uber Move ',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Text(
                                                            getJsonField(
                                                              countryItemItem,
                                                              r'''$.dial_code''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Uber Move ',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Text(
                                                            getJsonField(
                                                              countryItemItem,
                                                              r'''$.flag''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Uber Move ',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          width: 20.0)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (_model.countryList.length == 0)
                              Text(
                                'No items match your search',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
