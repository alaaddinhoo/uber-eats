import '/components/home_screen_skeleton_categories_widget.dart';
import '/components/home_screen_skeleton_restaurants_widget.dart';
import '/components/search_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'homescreen_skeleton_widget.dart' show HomescreenSkeletonWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomescreenSkeletonModel
    extends FlutterFlowModel<HomescreenSkeletonWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SearchBar component.
  late SearchBarModel searchBarModel;
  // Model for HomeScreenSkeletonCategories component.
  late HomeScreenSkeletonCategoriesModel homeScreenSkeletonCategoriesModel;
  // Model for HomeScreenSkeletonRestaurants component.
  late HomeScreenSkeletonRestaurantsModel homeScreenSkeletonRestaurantsModel;

  @override
  void initState(BuildContext context) {
    searchBarModel = createModel(context, () => SearchBarModel());
    homeScreenSkeletonCategoriesModel =
        createModel(context, () => HomeScreenSkeletonCategoriesModel());
    homeScreenSkeletonRestaurantsModel =
        createModel(context, () => HomeScreenSkeletonRestaurantsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBarModel.dispose();
    homeScreenSkeletonCategoriesModel.dispose();
    homeScreenSkeletonRestaurantsModel.dispose();
  }
}
