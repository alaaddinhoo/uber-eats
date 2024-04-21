import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'closed_restaurant_model.dart';
export 'closed_restaurant_model.dart';

class ClosedRestaurantWidget extends StatefulWidget {
  const ClosedRestaurantWidget({super.key});

  @override
  State<ClosedRestaurantWidget> createState() => _ClosedRestaurantWidgetState();
}

class _ClosedRestaurantWidgetState extends State<ClosedRestaurantWidget> {
  late ClosedRestaurantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClosedRestaurantModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(0.0, 0.0),
      children: [
        Opacity(
          opacity: 0.5,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0x67000000),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height * 0.75,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 28.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/ubereats-234aa.appspot.com/o/3d44102355841cb0163a00c005edffc7.png?alt=media&token=a5cf7e08-fff8-48d4-a331-96c6d8b048bc&_gl=1*1x357oc*_ga*MTE0NzczNDMuMTY5NTg4MzM0OQ..*_ga_CW55HF8NVT*MTY5NzMwNzA5MC43Ny4xLjE2OTczMDcxNzMuNDYuMC4w',
                        width: 140.0,
                        height: 140.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Restaurant Closed',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Uber Move ',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      'This restaurant is currently not accepting any order.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Uber Move ',
                            color: Color(0xFF4F4F4F),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Got it',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.black,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Uber Move ',
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ],
    );
  }
}
