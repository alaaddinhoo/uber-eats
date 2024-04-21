import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/closed_restaurant_widget.dart';
import '/components/home_screen_skeleton_categories_widget.dart';
import '/components/home_screen_skeleton_restaurants_widget.dart';
import '/components/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      await requestPermission(locationPermission);
      if (isWeb != true) {
        _model.output = await actions.infoFromLatLong(
          currentUserLocationValue!,
          'isoCountryCode',
        );
        setState(() {
          _model.userLoc = _model.output!;
        });
      }
    });

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final homeScreenUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
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
                                color:
                                    FFAppState().ChoiceOfService == 'Delivery'
                                        ? Colors.black
                                        : Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      color: FFAppState().ChoiceOfService ==
                                              'Delivery'
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
                                    color: FFAppState().ChoiceOfService ==
                                            'Pick-up'
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
                                      color: FFAppState().ChoiceOfService ==
                                              'Dine-in'
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Test'),
                                ChipData('Pick-up'),
                                ChipData('Dine-in')
                              ],
                              onChanged: (val) => setState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 5.0, 24.0, 5.0),
                                elevation: 4.0,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0x00202123),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Uber Move ',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 5.0, 24.0, 5.0),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              chipSpacing: 0.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.center,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['Test'],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.userLoc != null && _model.userLoc != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${FFAppState().ChoiceOfService} • ${_model.userLoc}'
                                  .maybeHandleOverflow(
                                maxChars: 36,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Uber Move ',
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 32.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: PagedListView<DocumentSnapshot<Object?>?,
                                  BrowseCategoriesRecord>(
                                pagingController: _model.setListViewController1(
                                  BrowseCategoriesRecord.collection.where(
                                    'homepageVisible',
                                    isEqualTo: true,
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.horizontal,
                                builderDelegate: PagedChildBuilderDelegate<
                                    BrowseCategoriesRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      HomeScreenSkeletonCategoriesWidget(),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      HomeScreenSkeletonCategoriesWidget(),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewBrowseCategoriesRecord =
                                        _model.listViewPagingController1!
                                            .itemList![listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'BrowseResult',
                                          queryParameters: {
                                            'category': serializeParam(
                                              listViewBrowseCategoriesRecord
                                                  .name,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 75.0,
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x65E6E6E6),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(11.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  listViewBrowseCategoriesRecord
                                                      .imageUrl,
                                                  width: 56.0,
                                                  height: 51.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                listViewBrowseCategoriesRecord
                                                    .name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Uber Move ',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 25.0),
                            child: StreamBuilder<List<RestaurantsRecord>>(
                              stream: queryRestaurantsRecord(
                                queryBuilder: (restaurantsRecord) =>
                                    restaurantsRecord.orderBy('acceptingOrders',
                                        descending: true),
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
                                  itemCount:
                                      listViewRestaurantsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewRestaurantsRecord =
                                        listViewRestaurantsRecordList[
                                            listViewIndex];
                                    return Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 25.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (listViewRestaurantsRecord
                                                    .acceptingOrders ==
                                                true) {
                                              context.pushNamed(
                                                'Restaurant',
                                                queryParameters: {
                                                  'restaurantId':
                                                      serializeParam(
                                                    listViewRestaurantsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child:
                                                          ClosedRestaurantWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }
                                          },
                                          child: Wrap(
                                            spacing: 0.0,
                                            runSpacing: 0.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: listViewRestaurantsRecord
                                                                        .acceptingOrders ==
                                                                    true
                                                                ? Colors
                                                                    .transparent
                                                                : Colors.black,
                                                          ),
                                                          child: Opacity(
                                                            opacity:
                                                                listViewRestaurantsRecord
                                                                            .acceptingOrders ==
                                                                        true
                                                                    ? 1.0
                                                                    : 0.5,
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 150.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.9,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .network(
                                                                        listViewRestaurantsRecord
                                                                            .coverUrl,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          -1.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            if (listViewRestaurantsRecord.offer ==
                                                                                true)
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
                                                                            if (listViewRestaurantsRecord.rewards != null &&
                                                                                listViewRestaurantsRecord.rewards != '')
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
                                                                                    'Earn ${listViewRestaurantsRecord.rewards} per order',
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            7.5,
                                                                            0.0),
                                                                        child:
                                                                            ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            final favoritesElement =
                                                                                listViewRestaurantsRecord.reference.id;
                                                                            final favoritesUpdate = homeScreenUsersRecord.favorites.contains(favoritesElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    favoritesElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    favoritesElement
                                                                                  ]);
                                                                            await homeScreenUsersRecord.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'favorites': favoritesUpdate,
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          value: homeScreenUsersRecord
                                                                              .favorites
                                                                              .contains(listViewRestaurantsRecord.reference.id),
                                                                          onIcon:
                                                                              Icon(
                                                                            Icons.favorite_outlined,
                                                                            color:
                                                                                Color(0xFFFF565D),
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (listViewRestaurantsRecord
                                                                .acceptingOrders ==
                                                            false)
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          5.0,
                                                                          15.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .access_time_rounded,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      Text(
                                                                        'Closed',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Uber Move ',
                                                                              color: Colors.black,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
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
                                                                fontSize: 14.0,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
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
                                                            letterSpacing: 0.0,
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
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                    Container(
                                                      width: 3.0,
                                                      height: 3.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF6B6B6B),
                                                        shape: BoxShape.circle,
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
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
