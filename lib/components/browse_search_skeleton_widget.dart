import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'browse_search_skeleton_model.dart';
export 'browse_search_skeleton_model.dart';

class BrowseSearchSkeletonWidget extends StatefulWidget {
  const BrowseSearchSkeletonWidget({
    super.key,
    this.parameter1,
  });

  final int? parameter1;

  @override
  State<BrowseSearchSkeletonWidget> createState() =>
      _BrowseSearchSkeletonWidgetState();
}

class _BrowseSearchSkeletonWidgetState
    extends State<BrowseSearchSkeletonWidget> {
  late BrowseSearchSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowseSearchSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0x65E6E6E6),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
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
            ].divide(SizedBox(height: 21.0)),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0x65E6E6E6),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
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
            ].divide(SizedBox(height: 21.0)),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0x65E6E6E6),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
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
            ].divide(SizedBox(height: 21.0)),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20.0,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 15.0,
                          decoration: BoxDecoration(
                            color: Color(0x65E6E6E6),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
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
            ].divide(SizedBox(height: 21.0)),
          ),
        ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}
