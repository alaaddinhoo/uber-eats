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
import 'browse_search_widget.dart' show BrowseSearchWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrowseSearchModel extends FlutterFlowModel<BrowseSearchWidget> {
  ///  Local state fields for this page.

  int? searchHistoryCount;

  int searchHistoryIndex = 0;

  bool clearedHistory = false;

  bool showRestaurants = false;

  dynamic searchListJSON;

  String chosenRestaurant = '';

  dynamic restaurantJSON;

  bool freeDelivery = false;

  bool topRated = false;

  String sortBy = '-rating';

  String chosenCategory = '';

  bool searchJSONLoading = false;

  bool restaurantJSONLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  int? historyCount;
  // Stores action output result for [Backend Call - API (Search multiple indices Categories Restaurants)] action in TextField widget.
  ApiCallResponse? apiResultyy;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Container widget.
  ApiCallResponse? apiResultSS;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Container widget.
  ApiCallResponse? apiResultRR;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Container widget.
  ApiCallResponse? apiResultEE;
  // Stores action output result for [Backend Call - API ( Search index POST)] action in Container widget.
  ApiCallResponse? apiResultk5p;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Container widget.
  ApiCallResponse? apiResultzz;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Container widget.
  ApiCallResponse? apiResultqqq;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Container widget.
  ApiCallResponse? apiResultqa;
  // Stores action output result for [Backend Call - API ( Search index POST)] action in Container widget.
  ApiCallResponse? apiResultk1111;
  // Stores action output result for [Backend Call - API (Search multiple indices Categories Restaurants)] action in Column widget.
  ApiCallResponse? apiResultyySSS;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Column widget.
  ApiCallResponse? resJSONCategoryCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  int? historyCount2;
  // Model for BrowseSearchSkeleton component.
  late BrowseSearchSkeletonModel browseSearchSkeletonModel;
  // Stores action output result for [Backend Call - API (Restaurant Search)] action in Column widget.
  ApiCallResponse? resJSONCategory;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  int? historyCount3;
  // Stores action output result for [Backend Call - API ( Search index POST)] action in Column widget.
  ApiCallResponse? resJSON;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  int? historyCount4;
  // Model for HomeScreenSkeletonRestaurants component.
  late HomeScreenSkeletonRestaurantsModel homeScreenSkeletonRestaurantsModel;

  @override
  void initState(BuildContext context) {
    browseSearchSkeletonModel =
        createModel(context, () => BrowseSearchSkeletonModel());
    homeScreenSkeletonRestaurantsModel =
        createModel(context, () => HomeScreenSkeletonRestaurantsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    browseSearchSkeletonModel.dispose();
    homeScreenSkeletonRestaurantsModel.dispose();
  }
}
