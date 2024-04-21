import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/browse_search_skeleton_widget.dart';
import '/components/home_screen_skeleton_restaurants_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'browse_search_model.dart';
export 'browse_search_model.dart';

class BrowseSearchWidget extends StatefulWidget {
  const BrowseSearchWidget({super.key});

  @override
  State<BrowseSearchWidget> createState() => _BrowseSearchWidgetState();
}

class _BrowseSearchWidgetState extends State<BrowseSearchWidget>
    with TickerProviderStateMixin {
  late BrowseSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowseSearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SearchHistoryRecord>>(
      stream: querySearchHistoryRecord(
        queryBuilder: (searchHistoryRecord) => searchHistoryRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'value',
              isNotEqualTo: null,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<SearchHistoryRecord> browseSearchSearchHistoryRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Browse');
                                    },
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 250.0,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 0),
                                          () async {
                                            if (_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') {
                                              setState(() {
                                                _model.searchJSONLoading = true;
                                              });
                                              _model.apiResultyy =
                                                  await SearchMultipleIndicesCategoriesRestaurantsCall
                                                      .call(
                                                queryStringVar:
                                                    _model.textController.text,
                                              );
                                              if ((_model
                                                      .apiResultyy?.succeeded ??
                                                  true)) {
                                                setState(() {
                                                  _model.searchJSONLoading =
                                                      false;
                                                });
                                                setState(() {
                                                  _model.searchListJSON =
                                                      (_model.apiResultyy
                                                              ?.jsonBody ??
                                                          '');
                                                });
                                              }
                                            } else {
                                              setState(() {
                                                _model.chosenCategory = '';
                                              });
                                              setState(() {
                                                _model.chosenRestaurant = '';
                                              });
                                              setState(() {
                                                _model.showRestaurants = false;
                                              });
                                            }

                                            setState(() {});
                                          },
                                        ),
                                        onFieldSubmitted: (_) async {
                                          if (_model.textController.text !=
                                                  null &&
                                              _model.textController.text !=
                                                  '') {
                                            _model.historyCount =
                                                await querySearchHistoryRecordCount(
                                              queryBuilder:
                                                  (searchHistoryRecord) =>
                                                      searchHistoryRecord
                                                          .where(
                                                            'user',
                                                            isEqualTo:
                                                                currentUserReference,
                                                          )
                                                          .where(
                                                            'value',
                                                            isEqualTo: _model
                                                                .textController
                                                                .text,
                                                          ),
                                            );
                                            if (_model.historyCount == 0) {
                                              await SearchHistoryRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createSearchHistoryRecordData(
                                                  user: currentUserReference,
                                                  value: _model
                                                      .textController.text,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'createdAt': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            }
                                          }

                                          setState(() {});
                                        },
                                        autofocus: true,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                          hintText:
                                              'Food, groceries, drinks, etc.',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          suffixIcon: _model.textController!
                                                  .text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model.textController
                                                        ?.clear();
                                                    if (_model.textController
                                                                .text !=
                                                            null &&
                                                        _model.textController
                                                                .text !=
                                                            '') {
                                                      setState(() {
                                                        _model.searchJSONLoading =
                                                            true;
                                                      });
                                                      _model.apiResultyy =
                                                          await SearchMultipleIndicesCategoriesRestaurantsCall
                                                              .call(
                                                        queryStringVar: _model
                                                            .textController
                                                            .text,
                                                      );
                                                      if ((_model.apiResultyy
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.searchJSONLoading =
                                                              false;
                                                        });
                                                        setState(() {
                                                          _model.searchListJSON =
                                                              (_model.apiResultyy
                                                                      ?.jsonBody ??
                                                                  '');
                                                        });
                                                      }
                                                    } else {
                                                      setState(() {
                                                        _model.chosenCategory =
                                                            '';
                                                      });
                                                      setState(() {
                                                        _model.chosenRestaurant =
                                                            '';
                                                      });
                                                      setState(() {
                                                        _model.showRestaurants =
                                                            false;
                                                      });
                                                    }

                                                    setState(() {});
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
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Adjust.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                unselectedLabelStyle: TextStyle(),
                                indicatorColor: Colors.black,
                                indicatorWeight: 3.0,
                                tabs: [
                                  Tab(
                                    text: 'Food',
                                  ),
                                  Tab(
                                    text: 'Groceries',
                                  ),
                                  Tab(
                                    text: 'Health & wellness',
                                  ),
                                  Tab(
                                    text: 'Flowers',
                                  ),
                                  Tab(
                                    text: 'More Shops',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {},
                                    () async {}
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFE8E8E8),
                                              ),
                                            ),
                                          ],
                                        ),
                                        if ((_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') &&
                                            ((_model.chosenRestaurant != null &&
                                                    _model.chosenRestaurant !=
                                                        '') ||
                                                (_model.chosenCategory !=
                                                        null &&
                                                    _model.chosenCategory !=
                                                        '')))
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.restaurantJSON =
                                                                functions.sortJson(
                                                                    _model
                                                                        .restaurantJSON!,
                                                                    _model
                                                                        .sortBy);
                                                          });
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE8E8E8),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .sort_sharp,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 16.0,
                                                                ),
                                                                Text(
                                                                  'Sort By',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                !_model
                                                                    .freeDelivery;
                                                          });
                                                          if ((_model.freeDelivery ==
                                                                  true) &&
                                                              (_model.topRated ==
                                                                  true)) {
                                                            _model.apiResultSS =
                                                                await RestaurantSearchCall
                                                                    .call(
                                                              filtersVar:
                                                                  'delivery_fee: \'\$0\' AND rating > 4.2',
                                                            );
                                                            if ((_model
                                                                    .apiResultSS
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultSS
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          } else if ((_model
                                                                      .freeDelivery ==
                                                                  true) &&
                                                              (_model.topRated ==
                                                                  false)) {
                                                            _model.apiResultRR =
                                                                await RestaurantSearchCall
                                                                    .call(
                                                              filtersVar:
                                                                  'delivery_fee: \'\$0\'',
                                                            );
                                                            if ((_model
                                                                    .apiResultRR
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultRR
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          } else if ((_model
                                                                      .freeDelivery ==
                                                                  false) &&
                                                              (_model.topRated ==
                                                                  true)) {
                                                            _model.apiResultEE =
                                                                await RestaurantSearchCall
                                                                    .call(
                                                              filtersVar:
                                                                  'rating > 4.2',
                                                            );
                                                            if ((_model
                                                                    .apiResultEE
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultEE
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          } else {
                                                            _model.apiResultk5p =
                                                                await SearchIndexPOSTCall
                                                                    .call(
                                                              indexName:
                                                                  'restaurants',
                                                            );
                                                            if ((_model
                                                                    .apiResultk5p
                                                                    ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultk5p
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                _model.freeDelivery ==
                                                                        true
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE8E8E8),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Free Delivery',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Uber Move ',
                                                                        color: _model.freeDelivery ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                if (_model
                                                                        .freeDelivery ==
                                                                    true)
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18.0,
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.topRated =
                                                                !_model
                                                                    .topRated;
                                                          });
                                                          if ((_model.freeDelivery ==
                                                                  true) &&
                                                              (_model.topRated ==
                                                                  true)) {
                                                            _model.apiResultzz =
                                                                await RestaurantSearchCall
                                                                    .call(
                                                              filtersVar:
                                                                  'delivery_fee: \'\$0\' AND rating > 4.2',
                                                            );
                                                            if ((_model
                                                                    .apiResultzz
                                                                    ?.jsonBody ??
                                                                '')) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultzz
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          } else if ((_model
                                                                      .freeDelivery ==
                                                                  true) &&
                                                              (_model.topRated ==
                                                                  false)) {
                                                            _model.apiResultqqq =
                                                                await RestaurantSearchCall
                                                                    .call(
                                                              filtersVar:
                                                                  'delivery_fee: \'\$0\'',
                                                            );
                                                            if ((_model
                                                                    .apiResultqqq
                                                                    ?.jsonBody ??
                                                                '')) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultqqq
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          } else if ((_model
                                                                      .freeDelivery ==
                                                                  false) &&
                                                              (_model.topRated ==
                                                                  true)) {
                                                            _model.apiResultqa =
                                                                await RestaurantSearchCall
                                                                    .call(
                                                              filtersVar:
                                                                  'rating > 4.2',
                                                            );
                                                            if ((_model
                                                                    .apiResultqa
                                                                    ?.jsonBody ??
                                                                '')) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultqa
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          } else {
                                                            _model.apiResultk1111 =
                                                                await SearchIndexPOSTCall
                                                                    .call(
                                                              indexName:
                                                                  'restaurants',
                                                            );
                                                            if ((_model
                                                                    .apiResultk1111
                                                                    ?.jsonBody ??
                                                                '')) {
                                                              setState(() {
                                                                _model
                                                                    .restaurantJSON = (_model
                                                                        .apiResultk1111
                                                                        ?.jsonBody ??
                                                                    '');
                                                              });
                                                            }
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                _model.topRated ==
                                                                        true
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE8E8E8),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Top Rated',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Uber Move ',
                                                                        color: _model.topRated ==
                                                                                true
                                                                            ? Colors.white
                                                                            : Colors.black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                if (_model
                                                                        .topRated ==
                                                                    true)
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18.0,
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFE8E8E8),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Fast Delivery',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (_model.textController.text ==
                                                null ||
                                            _model.textController.text == '')
                                          Flexible(
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if ((browseSearchSearchHistoryRecordList
                                                              .length >
                                                          0) &&
                                                      (_model.clearedHistory ==
                                                          false))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  27.0,
                                                                  0.0,
                                                                  27.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        23.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Recent Search',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Uber Move ',
                                                                        color: Color(
                                                                            0xFF6B6B6B),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.clearedHistory =
                                                                          true;
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.searchHistoryCount =
                                                                          browseSearchSearchHistoryRecordList
                                                                              .length;
                                                                    });
                                                                    _model.searchHistoryIndex =
                                                                        0;
                                                                    while (_model
                                                                            .searchHistoryIndex <
                                                                        _model
                                                                            .searchHistoryCount!) {
                                                                      await browseSearchSearchHistoryRecordList[
                                                                              _model.searchHistoryIndex]
                                                                          .reference
                                                                          .delete();
                                                                      _model.searchHistoryIndex =
                                                                          _model.searchHistoryIndex +
                                                                              1;
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        'Clear',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Uber Move ',
                                                                              color: Color(0xFF808080),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            StreamBuilder<
                                                                List<
                                                                    SearchHistoryRecord>>(
                                                              stream:
                                                                  querySearchHistoryRecord(
                                                                queryBuilder: (searchHistoryRecord) =>
                                                                    searchHistoryRecord
                                                                        .where(
                                                                          'user',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .orderBy(
                                                                            'createdAt',
                                                                            descending:
                                                                                true),
                                                                limit: 5,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return BrowseSearchSkeletonWidget();
                                                                }
                                                                List<SearchHistoryRecord>
                                                                    listViewSearchHistoryRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewSearchHistoryRecordList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewSearchHistoryRecord =
                                                                        listViewSearchHistoryRecordList[
                                                                            listViewIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.apiResultyySSS =
                                                                              await SearchMultipleIndicesCategoriesRestaurantsCall.call(
                                                                            queryStringVar:
                                                                                listViewSearchHistoryRecord.value,
                                                                          );
                                                                          if ((_model.apiResultyySSS?.jsonBody ??
                                                                              '')) {
                                                                            setState(() {
                                                                              _model.searchListJSON = (_model.apiResultyySSS?.jsonBody ?? '');
                                                                            });
                                                                            setState(() {
                                                                              _model.showRestaurants = false;
                                                                            });
                                                                            setState(() {
                                                                              _model.textController?.text = listViewSearchHistoryRecord.value;
                                                                            });
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.replay,
                                                                                  color: Colors.black,
                                                                                  size: 20.0,
                                                                                ),
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Text(
                                                                                    listViewSearchHistoryRecord.value,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Uber Move ',
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_outward,
                                                                                  color: Colors.black,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ].divide(SizedBox(width: 23.0)),
                                                                            ),
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFE8E8E8),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          SearchHistoryRecord>>(
                                                                    stream:
                                                                        querySearchHistoryRecord(
                                                                      queryBuilder: (searchHistoryRecord) => searchHistoryRecord
                                                                          .where(
                                                                            'user',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          )
                                                                          .where(
                                                                            'value',
                                                                            isNotEqualTo:
                                                                                '',
                                                                          ),
                                                                      limit: 5,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<SearchHistoryRecord>
                                                                          wrapSearchHistoryRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return Wrap(
                                                                        spacing:
                                                                            5.0,
                                                                        runSpacing:
                                                                            10.0,
                                                                        alignment:
                                                                            WrapAlignment.start,
                                                                        crossAxisAlignment:
                                                                            WrapCrossAlignment.start,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalDirection:
                                                                            VerticalDirection.down,
                                                                        clipBehavior:
                                                                            Clip.none,
                                                                        children: List.generate(
                                                                            wrapSearchHistoryRecordList.length,
                                                                            (wrapIndex) {
                                                                          final wrapSearchHistoryRecord =
                                                                              wrapSearchHistoryRecordList[wrapIndex];
                                                                          return Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(100.0),
                                                                              shape: BoxShape.rectangle,
                                                                              border: Border.all(
                                                                                color: Color(0xFF4F4F4F),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.restart_alt,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  Text(
                                                                                    wrapSearchHistoryRecord.value,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Uber Move ',
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(27.0, 0.0,
                                                                27.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          23.0),
                                                              child: Text(
                                                                'Top Categories',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Uber Move ',
                                                                      color: Color(
                                                                          0xFF6B6B6B),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        StreamBuilder<
                                                            List<
                                                                BrowseCategoriesRecord>>(
                                                          stream:
                                                              queryBrowseCategoriesRecord(
                                                            queryBuilder:
                                                                (browseCategoriesRecord) =>
                                                                    browseCategoriesRecord
                                                                        .where(
                                                              'topCategory',
                                                              isEqualTo: true,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return BrowseSearchSkeletonWidget();
                                                            }
                                                            List<BrowseCategoriesRecord>
                                                                listViewBrowseCategoriesRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewBrowseCategoriesRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewBrowseCategoriesRecord =
                                                                    listViewBrowseCategoriesRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.showRestaurants = true;
                                                                            });
                                                                            setState(() {
                                                                              _model.restaurantJSONLoading = true;
                                                                            });
                                                                            setState(() {
                                                                              _model.chosenCategory = listViewBrowseCategoriesRecord.name;
                                                                            });
                                                                            _model.resJSONCategoryCopy =
                                                                                await RestaurantSearchCall.call(
                                                                              filtersVar: 'category:${_model.chosenCategory}',
                                                                              searchVar: '*',
                                                                            );
                                                                            if ((_model.resJSONCategoryCopy?.succeeded ??
                                                                                true)) {
                                                                              setState(() {
                                                                                _model.restaurantJSON = (_model.resJSONCategoryCopy?.jsonBody ?? '');
                                                                              });
                                                                              setState(() {
                                                                                _model.textController?.text = _model.chosenCategory;
                                                                              });
                                                                              _model.historyCount2 = await querySearchHistoryRecordCount(
                                                                                queryBuilder: (searchHistoryRecord) => searchHistoryRecord
                                                                                    .where(
                                                                                      'user',
                                                                                      isEqualTo: currentUserReference,
                                                                                    )
                                                                                    .where(
                                                                                      'value',
                                                                                      isEqualTo: listViewBrowseCategoriesRecord.name,
                                                                                    ),
                                                                              );
                                                                              if (_model.historyCount2 == 0) {
                                                                                await SearchHistoryRecord.collection.doc().set({
                                                                                  ...createSearchHistoryRecordData(
                                                                                    user: currentUserReference,
                                                                                    value: _model.chosenCategory,
                                                                                  ),
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'createdAt': FieldValue.serverTimestamp(),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              }
                                                                              setState(() {
                                                                                _model.restaurantJSONLoading = false;
                                                                              });
                                                                            }

                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.search,
                                                                                    color: Colors.black,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                  Text(
                                                                                    listViewBrowseCategoriesRecord.name,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Uber Move ',
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 22.0)),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                height: 1.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFE8E8E8),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 12.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            21.0)),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 20.0)),
                                              ),
                                            ),
                                          ),
                                        if (_model.searchJSONLoading == true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .browseSearchSkeletonModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            BrowseSearchSkeletonWidget(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        if ((_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') &&
                                            (_model.showRestaurants == false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final categoriesSearchJSON =
                                                          getJsonField(
                                                        _model.searchListJSON,
                                                        r'''$.results[0].hits''',
                                                      ).toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            categoriesSearchJSON
                                                                .length,
                                                        itemBuilder: (context,
                                                            categoriesSearchJSONIndex) {
                                                          final categoriesSearchJSONItem =
                                                              categoriesSearchJSON[
                                                                  categoriesSearchJSONIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setState(() {
                                                                  _model.showRestaurants =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  _model.restaurantJSONLoading =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  _model.chosenCategory =
                                                                      getJsonField(
                                                                    categoriesSearchJSONItem,
                                                                    r'''$.name''',
                                                                  ).toString();
                                                                });
                                                                _model.resJSONCategory =
                                                                    await RestaurantSearchCall
                                                                        .call(
                                                                  filtersVar:
                                                                      'category:${getJsonField(
                                                                    categoriesSearchJSONItem,
                                                                    r'''$.name''',
                                                                  ).toString()}',
                                                                  searchVar:
                                                                      '*',
                                                                );
                                                                if ((_model
                                                                        .resJSONCategory
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    _model
                                                                        .restaurantJSON = (_model
                                                                            .resJSONCategory
                                                                            ?.jsonBody ??
                                                                        '');
                                                                  });
                                                                  setState(() {
                                                                    _model.textController
                                                                            ?.text =
                                                                        _model
                                                                            .chosenCategory;
                                                                  });
                                                                  _model.historyCount3 =
                                                                      await querySearchHistoryRecordCount(
                                                                    queryBuilder: (searchHistoryRecord) =>
                                                                        searchHistoryRecord
                                                                            .where(
                                                                              'user',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'value',
                                                                              isEqualTo: _model.chosenCategory,
                                                                            ),
                                                                  );
                                                                  if (_model
                                                                          .historyCount3 ==
                                                                      0) {
                                                                    await SearchHistoryRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set({
                                                                      ...createSearchHistoryRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        value: _model
                                                                            .chosenCategory,
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'createdAt':
                                                                              FieldValue.serverTimestamp(),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }
                                                                  setState(() {
                                                                    _model.restaurantJSONLoading =
                                                                        false;
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.grid_view,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Html(
                                                                                    data: getJsonField(
                                                                                      categoriesSearchJSONItem,
                                                                                      r'''$._highlightResult.name.value''',
                                                                                    ).toString(),
                                                                                    onLinkTap: (url, _, __, ___) => launchURL(url!),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_outward,
                                                                                  color: Colors.black,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 23.0)),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFE8E8E8),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        15.0)),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final restaurantsSearchJSON =
                                                          getJsonField(
                                                        _model.searchListJSON,
                                                        r'''$.results[1].hits''',
                                                      ).toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            restaurantsSearchJSON
                                                                .length,
                                                        itemBuilder: (context,
                                                            restaurantsSearchJSONIndex) {
                                                          final restaurantsSearchJSONItem =
                                                              restaurantsSearchJSON[
                                                                  restaurantsSearchJSONIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        15.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setState(() {
                                                                  _model.showRestaurants =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  _model.restaurantJSONLoading =
                                                                      true;
                                                                });
                                                                setState(() {
                                                                  _model.chosenRestaurant =
                                                                      getJsonField(
                                                                    restaurantsSearchJSONItem,
                                                                    r'''$.name''',
                                                                  ).toString();
                                                                });
                                                                _model.resJSON =
                                                                    await SearchIndexPOSTCall
                                                                        .call(
                                                                  indexName:
                                                                      'restaurants',
                                                                  query: '*',
                                                                  optionalFilters:
                                                                      'name:${_model.chosenRestaurant}',
                                                                );
                                                                if ((_model
                                                                        .resJSON
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  setState(() {
                                                                    _model
                                                                        .restaurantJSON = (_model
                                                                            .resJSON
                                                                            ?.jsonBody ??
                                                                        '');
                                                                  });
                                                                  setState(() {
                                                                    _model.textController
                                                                            ?.text =
                                                                        _model
                                                                            .chosenRestaurant;
                                                                  });
                                                                  _model.historyCount4 =
                                                                      await querySearchHistoryRecordCount(
                                                                    queryBuilder: (searchHistoryRecord) =>
                                                                        searchHistoryRecord
                                                                            .where(
                                                                              'user',
                                                                              isEqualTo: currentUserReference,
                                                                            )
                                                                            .where(
                                                                              'value',
                                                                              isEqualTo: _model.chosenRestaurant,
                                                                            ),
                                                                  );
                                                                  if (_model
                                                                          .historyCount4 ==
                                                                      0) {
                                                                    await SearchHistoryRecord
                                                                        .collection
                                                                        .doc()
                                                                        .set({
                                                                      ...createSearchHistoryRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        value: _model
                                                                            .chosenRestaurant,
                                                                      ),
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'createdAt':
                                                                              FieldValue.serverTimestamp(),
                                                                        },
                                                                      ),
                                                                    });
                                                                  }
                                                                  setState(() {
                                                                    _model.restaurantJSONLoading =
                                                                        false;
                                                                  });
                                                                }

                                                                setState(() {});
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.search,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Html(
                                                                                    data: getJsonField(
                                                                                      restaurantsSearchJSONItem,
                                                                                      r'''$._highlightResult.name.value''',
                                                                                    ).toString(),
                                                                                    onLinkTap: (url, _, __, ___) => launchURL(url!),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.arrow_outward,
                                                                                  color: Colors.black,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 23.0)),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFE8E8E8),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        15.0)),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  if ((functions
                                                              .arrayLength(
                                                                  getJsonField(
                                                                _model
                                                                    .searchListJSON,
                                                                r'''$.results[0].hits''',
                                                              ))
                                                              .toString() ==
                                                          functions
                                                              .return0()) &&
                                                      (functions
                                                              .arrayLength(
                                                                  getJsonField(
                                                                _model
                                                                    .searchListJSON,
                                                                r'''$.results[1].hits''',
                                                              ))
                                                              .toString() ==
                                                          functions.return0()))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  100.0,
                                                                  0.0,
                                                                  100.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'No results found',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Uber Move ',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Try searching for something else',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Uber Move ',
                                                                      color: Color(
                                                                          0xFF545454),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context.pushNamed(
                                                                      'HomeScreen');
                                                                },
                                                                text:
                                                                    'Back Home',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Colors
                                                                      .black,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Uber Move ',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (_model.restaurantJSONLoading ==
                                            true)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .homeScreenSkeletonRestaurantsModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          HomeScreenSkeletonRestaurantsWidget(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        if ((_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '') &&
                                            ((_model.chosenRestaurant != null &&
                                                    _model.chosenRestaurant !=
                                                        '') ||
                                                (_model.chosenCategory !=
                                                        null &&
                                                    _model.chosenCategory !=
                                                        '')) &&
                                            (_model.restaurantJSONLoading ==
                                                false))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 50.0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    columnUsersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnUsersRecord =
                                                    columnUsersRecordList
                                                            .isNotEmpty
                                                        ? columnUsersRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final restaurantList =
                                                            getJsonField(
                                                          _model.restaurantJSON,
                                                          r'''$.hits''',
                                                        ).toList();
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              restaurantList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              restaurantListIndex) {
                                                            final restaurantListItem =
                                                                restaurantList[
                                                                    restaurantListIndex];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'Restaurant',
                                                                        queryParameters:
                                                                            {
                                                                          'restaurantId':
                                                                              serializeParam(
                                                                            functions.returnJsonKey(getJsonField(
                                                                              restaurantListItem,
                                                                              r'''$.objectID''',
                                                                            ).toString()),
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Wrap(
                                                                      spacing:
                                                                          0.0,
                                                                      runSpacing:
                                                                          0.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Stack(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 150.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                    child: Opacity(
                                                                                      opacity: 0.8,
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(0.0),
                                                                                        child: Image.network(
                                                                                          getJsonField(
                                                                                            restaurantListItem,
                                                                                            r'''$.cover_url''',
                                                                                          ).toString(),
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          height: 150.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, -1.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              if (getJsonField(
                                                                                                restaurantListItem,
                                                                                                r'''$.offer''',
                                                                                              ))
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFF34A853),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(20.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(20.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 3.0, 20.0, 3.0),
                                                                                                    child: Text(
                                                                                                      'Offers Deals',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Uber Move ',
                                                                                                            color: Colors.white,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              if (getJsonField(
                                                                                                    restaurantListItem,
                                                                                                    r'''$.rewards''',
                                                                                                  ) !=
                                                                                                  null)
                                                                                                Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFF9234A8),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                      bottomRight: Radius.circular(20.0),
                                                                                                      topLeft: Radius.circular(0.0),
                                                                                                      topRight: Radius.circular(20.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 3.0, 20.0, 3.0),
                                                                                                    child: Text(
                                                                                                      'Earn ${getJsonField(
                                                                                                        restaurantListItem,
                                                                                                        r'''$.rewards''',
                                                                                                      ).toString()} per order',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Uber Move ',
                                                                                                            color: Colors.white,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                            ].divide(SizedBox(height: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 7.5, 0.0),
                                                                                          child: ToggleIcon(
                                                                                            onPressed: () async {
                                                                                              final favoritesElement = (getJsonField(
                                                                                                restaurantListItem,
                                                                                                r'''$.objectID''',
                                                                                                true,
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList();
                                                                                              final favoritesUpdate = columnUsersRecord!.favorites.contains(favoritesElement) ? FieldValue.arrayRemove([favoritesElement]) : FieldValue.arrayUnion([favoritesElement]);
                                                                                              await columnUsersRecord!.reference.update({
                                                                                                ...mapToFirestore(
                                                                                                  {
                                                                                                    'favorites': favoritesUpdate,
                                                                                                  },
                                                                                                ),
                                                                                              });
                                                                                            },
                                                                                            value: columnUsersRecord!.favorites.contains(getJsonField(
                                                                                              restaurantListItem,
                                                                                              r'''$.objectID''',
                                                                                            ).toString()),
                                                                                            onIcon: Icon(
                                                                                              Icons.favorite_outlined,
                                                                                              color: Color(0xFFFF565D),
                                                                                              size: 25.0,
                                                                                            ),
                                                                                            offIcon: Icon(
                                                                                              Icons.favorite_border,
                                                                                              color: Colors.white,
                                                                                              size: 25.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    restaurantListItem,
                                                                                    r'''$.name''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        fontFamily: 'Uber Move ',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height: 27.2,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEEEEEE),
                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.5, 3.0, 5.5, 3.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      restaurantListItem,
                                                                                      r'''$.rating''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Uber Move ',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  restaurantListItem,
                                                                                  r'''$.delivery_fee''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Uber Move ',
                                                                                      color: Color(0xFF6B6B6B),
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  'Delivery Fee',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Uber Move ',
                                                                                        color: Color(0xFF6B6B6B),
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 3.0,
                                                                                height: 3.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF6B6B6B),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    restaurantListItem,
                                                                                    r'''$.delivery_time''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Uber Move ',
                                                                                        color: Color(0xFF6B6B6B),
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final categoryList = getJsonField(
                                                                                restaurantListItem,
                                                                                r'''$.category''',
                                                                              ).toList();
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(categoryList.length, (categoryListIndex) {
                                                                                  final categoryListItem = categoryList[categoryListIndex];
                                                                                  return Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      borderRadius: BorderRadius.circular(80.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        categoryListItem.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Uber Move ',
                                                                                              color: Color(0xFF4F4F4F),
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }).divide(SizedBox(width: 5.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            20.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              7.5,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFEEEEEE),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 25.0)),
                                    ),
                                  ),
                                  Text(
                                    'Tab View 2',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    'Tab View 3',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    'Tab View 4',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    'Tab View 5',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Uber Move ',
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
