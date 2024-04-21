import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_skeleton_restaurants_model.dart';
export 'home_screen_skeleton_restaurants_model.dart';

class HomeScreenSkeletonRestaurantsWidget extends StatefulWidget {
  const HomeScreenSkeletonRestaurantsWidget({super.key});

  @override
  State<HomeScreenSkeletonRestaurantsWidget> createState() =>
      _HomeScreenSkeletonRestaurantsWidgetState();
}

class _HomeScreenSkeletonRestaurantsWidgetState
    extends State<HomeScreenSkeletonRestaurantsWidget> {
  late HomeScreenSkeletonRestaurantsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenSkeletonRestaurantsModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x65E6E6E6),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.075,
                        height: MediaQuery.sizeOf(context).width * 0.075,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x65E6E6E6),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.075,
                        height: MediaQuery.sizeOf(context).width * 0.075,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0x65E6E6E6),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.075,
                        height: MediaQuery.sizeOf(context).width * 0.075,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0x65E6E6E6),
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
    );
  }
}
