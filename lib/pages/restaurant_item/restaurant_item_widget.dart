import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'restaurant_item_model.dart';
export 'restaurant_item_model.dart';

class RestaurantItemWidget extends StatefulWidget {
  const RestaurantItemWidget({
    super.key,
    required this.item,
  });

  final DocumentReference? item;

  @override
  State<RestaurantItemWidget> createState() => _RestaurantItemWidgetState();
}

class _RestaurantItemWidgetState extends State<RestaurantItemWidget> {
  late RestaurantItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantItemModel());

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartRecord>>(
      stream: queryCartRecord(
        queryBuilder: (cartRecord) => cartRecord
            .where(
              'user',
              isEqualTo: currentUserReference,
            )
            .where(
              'item',
              isEqualTo: widget.item,
            ),
      ),
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
        List<CartRecord> restaurantItemCartRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: StreamBuilder<ItemsRecord>(
                  stream: ItemsRecord.getDocument(widget.item!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final columnItemsRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back_sharp,
                                color: Colors.black,
                                size: 28.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              columnItemsRecord.name,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Uber Move ',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              formatNumber(
                                columnItemsRecord.price,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                                currency: 'AED ',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Uber Move ',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  columnItemsRecord.ingredients,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Uber Move ',
                                        color: Color(0xFF545454),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (restaurantItemCartRecordList.length == 1)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Instructions for your order',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1 ??=
                                                        TextEditingController(
                                                  text:
                                                      restaurantItemCartRecordList
                                                          .first.instructions,
                                                ),
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Uber Move ',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintText:
                                                      'Example: Add extra sauce, no mayo',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Uber Move ',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Uber Move ',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await restaurantItemCartRecordList
                                            .first.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'quantity':
                                                  FieldValue.increment(-(1)),
                                            },
                                          ),
                                        });
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.black,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      restaurantItemCartRecordList
                                          .first.quantity
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Uber Move ',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await restaurantItemCartRecordList
                                            .first.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'quantity':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: Colors.black,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await restaurantItemCartRecordList
                                          .first.reference
                                          .update(createCartRecordData(
                                        instructions:
                                            _model.textController1.text,
                                      ));
                                      context.safePop();
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 15.0),
                                        child: Text(
                                          'Update Basket',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (restaurantItemCartRecordList.length == 0)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Instructions for your order',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Uber Move ',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintText:
                                                      'Example: Add extra sauce, no mayo',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Uber Move ',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Uber Move ',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.counter = _model.counter! + 1;
                                        });
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.black,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        _model.counter?.toString(),
                                        '1',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Uber Move ',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.counter = _model.counter! + 1;
                                        });
                                      },
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          color: Colors.black,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await CartRecord.collection
                                          .doc()
                                          .set(createCartRecordData(
                                            user: currentUserReference,
                                            item: widget.item,
                                            quantity: _model.counter,
                                            instructions:
                                                _model.textController2.text,
                                          ));
                                      context.safePop();
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 15.0),
                                        child: Text(
                                          'Add 1 to Basket',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Uber Move ',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ].divide(SizedBox(height: 10.0)),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
