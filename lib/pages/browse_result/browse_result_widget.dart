import '/backend/backend.dart';
import '/components/home_screen_skeleton_restaurants_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'browse_result_model.dart';
export 'browse_result_model.dart';

class BrowseResultWidget extends StatefulWidget {
  const BrowseResultWidget({
    super.key,
    required this.category,
  });

  final String? category;

  @override
  State<BrowseResultWidget> createState() => _BrowseResultWidgetState();
}

class _BrowseResultWidgetState extends State<BrowseResultWidget> {
  late BrowseResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowseResultModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
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
        List<UsersRecord> browseResultUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final browseResultUsersRecord = browseResultUsersRecordList.isNotEmpty
            ? browseResultUsersRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: FutureBuilder<int>(
                future: queryRestaurantsRecordCount(
                  queryBuilder: (restaurantsRecord) => restaurantsRecord.where(
                    'category',
                    arrayContains: widget.category,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  int columnCount = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 25.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.arrow_back_outlined,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.category!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                fontSize: 36.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: StreamBuilder<List<RestaurantsRecord>>(
                                    stream: queryRestaurantsRecord(
                                      queryBuilder: (restaurantsRecord) =>
                                          restaurantsRecord.where(
                                        'category',
                                        arrayContains: widget.category,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return HomeScreenSkeletonRestaurantsWidget();
                                      }
                                      List<RestaurantsRecord>
                                          listViewRestaurantsRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewRestaurantsRecordList
                                            .length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewRestaurantsRecord =
                                              listViewRestaurantsRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 25.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Restaurant',
                                                  queryParameters: {
                                                    'restaurantId':
                                                        serializeParam(
                                                      listViewRestaurantsRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 150.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              child: Opacity(
                                                                opacity: 0.7,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .network(
                                                                    listViewRestaurantsRecord
                                                                        .coverUrl,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        150.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: ToggleIcon(
                                                                onPressed:
                                                                    () async {
                                                                  final favoritesElement =
                                                                      listViewRestaurantsRecord
                                                                          .reference
                                                                          .id;
                                                                  final favoritesUpdate = browseResultUsersRecord!
                                                                          .favorites
                                                                          .contains(
                                                                              favoritesElement)
                                                                      ? FieldValue
                                                                          .arrayRemove([
                                                                          favoritesElement
                                                                        ])
                                                                      : FieldValue
                                                                          .arrayUnion([
                                                                          favoritesElement
                                                                        ]);
                                                                  await browseResultUsersRecord!
                                                                      .reference
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'favorites':
                                                                            favoritesUpdate,
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                                value: browseResultUsersRecord!
                                                                    .favorites
                                                                    .contains(
                                                                        listViewRestaurantsRecord
                                                                            .reference
                                                                            .id),
                                                                onIcon: Icon(
                                                                  Icons
                                                                      .favorite_outlined,
                                                                  color: Color(
                                                                      0xFFFF565D),
                                                                  size: 25.0,
                                                                ),
                                                                offIcon: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            listViewRestaurantsRecord
                                                                .name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Uber Move ',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 27.2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFEEEEEE),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.5,
                                                                        3.0,
                                                                        5.5,
                                                                        3.0),
                                                            child: Text(
                                                              listViewRestaurantsRecord
                                                                  .rating
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Uber Move ',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          listViewRestaurantsRecord
                                                              .deliveryFee,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Delivery Fee',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        Container(
                                                          width: 3.0,
                                                          height: 3.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF6B6B6B),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            listViewRestaurantsRecord
                                                                .deliveryTime,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            if (columnCount == 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 45.0, 0.0, 45.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.network(
                                        'https://s3-alpha-sig.figma.com/img/f62c/6c34/3d44102355841cb0163a00c005edffc7?Expires=1697414400&Signature=ZeUQD5~-4~hN9BU~bzugM7Xrz-SY65lEDy9zSClRE8fiwk~kOMjopO7nqOjet9XF0dxLZQQ3wUc46YbEsEyOYl-bHChKzdalHclxqoLc8US-gwTR52~ryjEmjof6gWfNq2yRu12g5RYrBMQUCB9EhbCl-9rhvdjkUZK8b3B~gNVTRdwj9wGs0FwBlpuT0nbzma6aJPBCHTpf9OK~QCPSJg08xWnfWn3UUzJOFZFI0HHkiK9yaB8Cuy1BitE2ZYqYAoTKbyaUqdsY24oDcwEG7aMbFqyDVG~SAg90xJMXBk8KNRKJYPuFCvmYxFOqdKSrX6OTqwE-PGJ~aff45jYttQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                        width: 175.0,
                                        height: 130.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'No restaurants available',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Uber Move ',
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'You can choose another \ncategory in the meantime.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Uber Move ',
                                              color: Color(0xFF545454),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'Browse',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Other categories',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.black,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Uber Move ',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
