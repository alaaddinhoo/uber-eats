import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'browse_skeleton_model.dart';
export 'browse_skeleton_model.dart';

class BrowseSkeletonWidget extends StatefulWidget {
  const BrowseSkeletonWidget({super.key});

  @override
  State<BrowseSkeletonWidget> createState() => _BrowseSkeletonWidgetState();
}

class _BrowseSkeletonWidgetState extends State<BrowseSkeletonWidget> {
  late BrowseSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrowseSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.3,
      ),
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 98.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Container(
                  width: double.infinity,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 98.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Container(
                  width: double.infinity,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 98.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Container(
                  width: double.infinity,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 98.0,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Container(
                  width: double.infinity,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
