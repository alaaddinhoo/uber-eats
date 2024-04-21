import '/components/home_screen_skeleton_categories_widget.dart';
import '/components/home_screen_skeleton_restaurants_widget.dart';
import '/components/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homescreen_skeleton_model.dart';
export 'homescreen_skeleton_model.dart';

class HomescreenSkeletonWidget extends StatefulWidget {
  const HomescreenSkeletonWidget({super.key});

  @override
  State<HomescreenSkeletonWidget> createState() =>
      _HomescreenSkeletonWidgetState();
}

class _HomescreenSkeletonWidgetState extends State<HomescreenSkeletonWidget> {
  late HomescreenSkeletonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomescreenSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().ChoiceOfService = 'Delivery';
                          });
                        },
                        text: 'Delivery',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FFAppState().ChoiceOfService == 'Delivery'
                              ? Colors.black
                              : Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Uber Move ',
                                color:
                                    FFAppState().ChoiceOfService == 'Delivery'
                                        ? Colors.white
                                        : Colors.black,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                FFAppState().ChoiceOfService = 'Pick-up';
                              });
                            },
                            text: 'Pick-up',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FFAppState().ChoiceOfService == 'Pick-up'
                                  ? Colors.black
                                  : Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Uber Move ',
                                    color: FFAppState().ChoiceOfService ==
                                            'Pick-up'
                                        ? Colors.white
                                        : Colors.black,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 13.0, 0.0),
                            child: Container(
                              width: 7.5,
                              height: 7.5,
                              decoration: BoxDecoration(
                                color: Color(0xFFC30006),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().ChoiceOfService = 'Dine-in';
                          });
                        },
                        text: 'Dine-in',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FFAppState().ChoiceOfService == 'Dine-in'
                              ? Colors.black
                              : Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Uber Move ',
                                color: FFAppState().ChoiceOfService == 'Dine-in'
                                    ? Colors.white
                                    : Colors.black,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: wrapWithModel(
                          model: _model.searchBarModel,
                          updateCallback: () => setState(() {}),
                          child: SearchBarWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.homeScreenSkeletonCategoriesModel,
                  updateCallback: () => setState(() {}),
                  child: HomeScreenSkeletonCategoriesWidget(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 7.5,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.homeScreenSkeletonRestaurantsModel,
                  updateCallback: () => setState(() {}),
                  child: HomeScreenSkeletonRestaurantsWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
