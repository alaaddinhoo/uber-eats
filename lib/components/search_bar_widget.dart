import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_bar_model.dart';
export 'search_bar_model.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late SearchBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchBarModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'Browse',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.bottomToTop,
            ),
          },
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 20.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Container(
                  width: 250.0,
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Uber Move ',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                      hintText: 'Food, groceries, drinks, etc.',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Uber Move ',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Uber Move ',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: SvgPicture.asset(
                    'assets/images/Adjust.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
