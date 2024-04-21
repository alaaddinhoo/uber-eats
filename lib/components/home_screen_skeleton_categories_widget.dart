import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_skeleton_categories_model.dart';
export 'home_screen_skeleton_categories_model.dart';

class HomeScreenSkeletonCategoriesWidget extends StatefulWidget {
  const HomeScreenSkeletonCategoriesWidget({super.key});

  @override
  State<HomeScreenSkeletonCategoriesWidget> createState() =>
      _HomeScreenSkeletonCategoriesWidgetState();
}

class _HomeScreenSkeletonCategoriesWidgetState
    extends State<HomeScreenSkeletonCategoriesWidget> {
  late HomeScreenSkeletonCategoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenSkeletonCategoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 75.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0x65E6E6E6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Color(0x65E6E6E6),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 75.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0x65E6E6E6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Color(0x65E6E6E6),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 75.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0x65E6E6E6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Color(0x65E6E6E6),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 75.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0x65E6E6E6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Color(0x65E6E6E6),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
