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
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.

  String userLoc = '187 Ferndale Rd, Brixton';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - infoFromLatLong] action in HomeScreen widget.
  String? output;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for SearchBar component.
  late SearchBarModel searchBarModel;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, BrowseCategoriesRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  @override
  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarModel.dispose();
    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, BrowseCategoriesRecord>
      setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, BrowseCategoriesRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BrowseCategoriesRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBrowseCategoriesRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
