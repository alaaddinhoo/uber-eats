import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_model.dart';
export 'account_model.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  late AccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountModel());

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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 60.0,
                            height: 60.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              currentUserPhoto != null && currentUserPhoto != ''
                                  ? currentUserPhoto
                                  : 'https://firebasestorage.googleapis.com/v0/b/ubereats-234aa.appspot.com/o/b6a18f0ffd345b22cd219ef0e73ea5fe-removebg-preview.png?alt=media&token=b86b0e86-098a-46fa-b379-521772d3f11c&_gl=1*1jz5afi*_ga*MTE0NzczNDMuMTY5NTg4MzM0OQ..*_ga_CW55HF8NVT*MTY5NzU2MDIxOS45Mi4xLjE2OTc1NjQ4NzguNTIuMC4w',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserEmail != null &&
                                        currentUserEmail != ''
                                    ? currentUserEmail
                                    : currentPhoneNumber,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      color: Color(0xFF378661),
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                      ].divide(SizedBox(width: 15.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/ubereats-234aa.appspot.com/o/Star-banner_mobile_4.svg?alt=media&token=35ac19d9-f485-49c3-a1ff-af048827b6ee&_gl=1*1u16cpz*_ga*MTE0NzczNDMuMTY5NTg4MzM0OQ..*_ga_CW55HF8NVT*MTY5NjYxNjk3My4yNC4xLjE2OTY2MTc0OTYuNjAuMC4w',
                                width: 30.0,
                                height: 30.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            AuthUserStreamWidget(
                              builder: (context) => Text(
                                '${valueOrDefault(currentUserDocument?.points, 0).toString()} pts',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Rewards Hub',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Uber Move ',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Your Favorites',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.auto_fix_high_sharp,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Your Orders',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.payment_rounded,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Payment',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.notifications_outlined,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Notifications',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.discount_outlined,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Promotions',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.work_outline,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Deliver with Uber',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.diamond_sharp,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Restaurant Rewards',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.contact_support_outlined,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Customer Support',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: Color(0xFF1F1F1F),
                                    size: 24.0,
                                  ),
                                  Text(
                                    'Settings',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                            ].divide(SizedBox(height: 25.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 2.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'AuthMain', context.mounted);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Color(0xFFFF565D),
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Logout',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Uber Move ',
                                            color: Color(0xFFFF565D),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
                                ),
                              ),
                            ].divide(SizedBox(height: 25.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
