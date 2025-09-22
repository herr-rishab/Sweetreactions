import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/limit_reminder_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.time = await TimeCall.call();

      FFAppState().currentTime = TimeCall.time(
        (_model.time?.jsonBody ?? ''),
      )!;
      safeSetState(() {});
      _model.subscription = await querySubscriptionRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!valueOrDefault<bool>(currentUserDocument?.isPaid, false) &&
          (valueOrDefault(currentUserDocument?.lifetimeQueries, 0) <
              _model.subscription!.freeLifetimeQueries)) {
        if (!functions.limitCheck(
            valueOrDefault(currentUserDocument?.lastQueryTime, ''),
            FFAppState().currentTime)) {
          await currentUserReference!.update(createUsersRecordData(
            noOfQueries: 0,
          ));
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.hide = !_model.hide;
        safeSetState(() {});
      },
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<SubscriptionRecord>>(
      stream: querySubscriptionRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Image.asset(
              'assets/images/Splash_screen.png',
              width: double.infinity,
              height: double.infinity,
            ),
          );
        }
        List<SubscriptionRecord> homePageSubscriptionRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homePageSubscriptionRecord =
            homePageSubscriptionRecordList.isNotEmpty
                ? homePageSubscriptionRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Stack(
                  children: [
                    if (FFAppState().currentTime != '')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 20.0, 8.0, 0.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                  ChatHistoryWidget.routeName);
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.keyboard_arrow_left,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 28.0,
                                                  ),
                                                ),
                                                Text(
                                                  'Chats',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'sweetreactions.ai',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                  lineHeight: 0.0,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kgroup,
                                              color: Color(0xFFA4A49C),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 200.0,
                                                  child: Stack(
                                                    children: [
                                                      if (!_model.isLoading)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        56.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Screenshot_2025-06-27_at_8.50.23_PM-removebg-preview.png',
                                                                height: 48.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (_model.isLoading)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        40.0),
                                                            child:
                                                                Lottie.network(
                                                              'https://lottie.host/9ed43530-dd0d-4fe9-8a65-5a14e39ae206/9703Vrzx0n.json',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 200.0,
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                              animate: true,
                                                            ),
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Text(
                                                          'Let\'s make your meal\nblood sugar friendly',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (!valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isPaid,
                                                        false) &&
                                                    (homePageSubscriptionRecord!
                                                            .freeDailyQueries >
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.noOfQueries,
                                                            0)) &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.lifetimeQueries,
                                                            0) <
                                                        homePageSubscriptionRecord
                                                            .freeLifetimeQueries))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Container(
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.none,
                                                            image: Image.asset(
                                                              'assets/images/Screenshot_2025-06-01_at_11.18.32_PM.png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFD97B5C),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .remove_circle,
                                                                color: Color(
                                                                    0xFFD97B5C),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '1 free optimization left today',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF2E2B22),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if ((!valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isPaid,
                                                      false) &&
                                                  (homePageSubscriptionRecord!
                                                          .freeDailyQueries >
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.noOfQueries,
                                                          0)) &&
                                                  ((_model.textFieldFocusNode
                                                              ?.hasFocus ??
                                                          false) ==
                                                      false) &&
                                                  (valueOrDefault(
                                                          currentUserDocument
                                                              ?.lifetimeQueries,
                                                          0) <
                                                      homePageSubscriptionRecord
                                                          .freeLifetimeQueries)) ||
                                              (valueOrDefault<
                                                          bool>(
                                                      currentUserDocument
                                                          ?.isPaid,
                                                      false) &&
                                                  (homePageSubscriptionRecord!
                                                          .paidMonthlyQueries >
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.noOfQueries,
                                                          0)) &&
                                                  ((_model.textFieldFocusNode
                                                              ?.hasFocus ??
                                                          false) ==
                                                      false)) ||
                                              _model.hide)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.textController
                                                                    ?.text =
                                                                '1 Cup Rajma with 100 grams chawal';
                                                            _model
                                                                .textFieldFocusNode
                                                                ?.requestFocus();
                                                            WidgetsBinding
                                                                .instance
                                                                .addPostFrameCallback(
                                                                    (_) {
                                                              _model.textController
                                                                      ?.selection =
                                                                  TextSelection
                                                                      .collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length,
                                                              );
                                                            });
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 160.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Text(
                                                              '1 Cup Rajma with 100 gm chawal',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .hankenGrotesk(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.textController
                                                                    ?.text =
                                                                '250 ml Orange Juice';
                                                            _model
                                                                .textFieldFocusNode
                                                                ?.requestFocus();
                                                            WidgetsBinding
                                                                .instance
                                                                .addPostFrameCallback(
                                                                    (_) {
                                                              _model.textController
                                                                      ?.selection =
                                                                  TextSelection
                                                                      .collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length,
                                                              );
                                                            });
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 160.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Text(
                                                              '250 ml Orange Juice',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .hankenGrotesk(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.textController
                                                                    ?.text =
                                                                '2 Idlis, 1 Cup Sambhar ';
                                                            _model
                                                                .textFieldFocusNode
                                                                ?.requestFocus();
                                                            WidgetsBinding
                                                                .instance
                                                                .addPostFrameCallback(
                                                                    (_) {
                                                              _model.textController
                                                                      ?.selection =
                                                                  TextSelection
                                                                      .collapsed(
                                                                offset: _model
                                                                    .textController!
                                                                    .text
                                                                    .length,
                                                              );
                                                            });
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 160.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Text(
                                                              '2 Idlis, 1 Cup Sambhar ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .hankenGrotesk(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 12.0))
                                                        .addToStart(SizedBox(
                                                            width: 16.0))
                                                        .addToEnd(SizedBox(
                                                            width: 16.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ].divide(SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                ),
                              ],
                            ),
                          ),
                          if ((!valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false) &&
                                  (homePageSubscriptionRecord!
                                          .freeDailyQueries >
                                      valueOrDefault(
                                          currentUserDocument?.noOfQueries,
                                          0)) &&
                                  (valueOrDefault(
                                          currentUserDocument?.lifetimeQueries,
                                          0) <
                                      homePageSubscriptionRecord
                                          .freeLifetimeQueries)) ||
                              (valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false) &&
                                  (homePageSubscriptionRecord!
                                          .paidMonthlyQueries >
                                      valueOrDefault(
                                          currentUserDocument?.noOfQueries,
                                          0))))
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: double.infinity,
                                height: 160.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        -2.0,
                                      ),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(24.0),
                                    topRight: Radius.circular(24.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'What are you having?',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor1,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        maxLines: 2,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (!_model.isLoading)
                                              FlutterFlowIconButton(
                                                borderRadius: 30.0,
                                                buttonSize: 36.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.send_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 16.0,
                                                ),
                                                onPressed: () async {
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.noOfQueries,
                                                          0) ==
                                                      homePageSubscriptionRecord
                                                          .softPaidMonthlyQueries) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      useSafeArea: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                LimitReminderWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                  _model.isLoading = true;
                                                  _model.chatID =
                                                      random_data.randomString(
                                                    10,
                                                    10,
                                                    true,
                                                    false,
                                                    false,
                                                  );
                                                  _model.que = _model
                                                      .textController.text;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.textController
                                                        ?.clear();
                                                  });
                                                  unawaited(
                                                    () async {}(),
                                                  );

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    lastQueryTime: FFAppState()
                                                        .currentTime,
                                                  ));
                                                  _model.output =
                                                      await AskCall.call(
                                                    query: _model.que,
                                                    chatHistoryJson: [],
                                                  );

                                                  if (AskCall.limit(
                                                        (_model.output
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      true) {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'noOfQueries':
                                                              FieldValue
                                                                  .increment(1),
                                                          'lifetimeQueries':
                                                              FieldValue
                                                                  .increment(1),
                                                        },
                                                      ),
                                                    });
                                                  }

                                                  await ChatsRecord.collection
                                                      .doc()
                                                      .set({
                                                    ...createChatsRecordData(
                                                      uid: currentUserUid,
                                                      chatID: _model.chatID,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'content': [
                                                          getChatCompFirestoreData(
                                                            updateChatCompStruct(
                                                              ChatCompStruct(
                                                                userContent:
                                                                    _model.que,
                                                                assistantContent:
                                                                    AskCall
                                                                        .response(
                                                                  (_model.output
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                              create: true,
                                                            ),
                                                            true,
                                                          )
                                                        ],
                                                        'time': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.isLoading = false;
                                                  safeSetState(() {});

                                                  context.pushNamed(
                                                    ResponseWidget.routeName,
                                                    queryParameters: {
                                                      'chatID': serializeParam(
                                                        _model.chatID,
                                                        ParamType.String,
                                                      ),
                                                      'hasFollowUp':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  safeSetState(() {});
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if ((!valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false) &&
                                  (homePageSubscriptionRecord!
                                          .freeDailyQueries <=
                                      valueOrDefault(
                                          currentUserDocument?.noOfQueries,
                                          0))) ||
                              (valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false) &&
                                  (homePageSubscriptionRecord!
                                          .paidMonthlyQueries <=
                                      valueOrDefault(
                                          currentUserDocument?.noOfQueries,
                                          0))))
                            AuthUserStreamWidget(
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: 320.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.none,
                                          image: Image.asset(
                                            'assets/images/Screenshot_2025-06-01_at_11.18.32_PM.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: Color(0xFFD97B5C),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.lifetimeQueries,
                                                        0) ==
                                                    homePageSubscriptionRecord
                                                        .freeLifetimeQueries))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'You’ve used all ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF2E2B22),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight: 0.0,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: homePageSubscriptionRecord
                                                            .freeLifetimeQueries
                                                            .toString(),
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' free meal optimizations',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF2E2B22),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            if (!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.lifetimeQueries,
                                                        0) ==
                                                    homePageSubscriptionRecord
                                                        .freeLifetimeQueries))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '\nThat’s ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF2E2B22),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight: 0.0,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          homePageSubscriptionRecord
                                                              .freeLifetimeQueries
                                                              .toString(),
                                                          '7',
                                                        ),
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' smarter meals already — nicely done.\nTo keep going, unlock unlimited access.',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF2E2B22),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            if (!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.lifetimeQueries,
                                                        0) <
                                                    homePageSubscriptionRecord
                                                        .freeLifetimeQueries))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'That’s your free optimization for today.',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF262624),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight: 0.0,
                                                            ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            if (!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.lifetimeQueries,
                                                        0) <
                                                    homePageSubscriptionRecord
                                                        .freeLifetimeQueries))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            '\nWant smart swaps for every meal?\nUnlock unlimited access — no calorie counting, no crash diets.',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF262624),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight: 0.0,
                                                            ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF262624),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            if (valueOrDefault<bool>(
                                                currentUserDocument?.isPaid,
                                                false))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'You’ve maxed out your plan for this month',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF262624),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight: 0.0,
                                                            ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF262624),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            if (valueOrDefault<bool>(
                                                currentUserDocument?.isPaid,
                                                false))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '\nThat’s ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF2E2B22),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                              lineHeight: 0.0,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          homePageSubscriptionRecord
                                                              .paidMonthlyQueries
                                                              .toString(),
                                                          '300',
                                                        ),
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' optimized meals — seriously impressive. You’ve hit the fair usage limit for your plan. It resets on [July 1, 2025] — just a short break till then.',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF2E2B22),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 0.0,
                                                        ),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (!valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 24.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              BuySubscriptionWidget.routeName);
                                        },
                                        text: 'Upgrade for Unlimited Access',
                                        options: FFButtonOptions(
                                          width: 280.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconAlignment: IconAlignment.end,
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.hankenGrotesk(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  if (!valueOrDefault<bool>(
                                          currentUserDocument?.isPaid, false) &&
                                      (valueOrDefault(
                                              currentUserDocument
                                                  ?.lifetimeQueries,
                                              0) ==
                                          homePageSubscriptionRecord
                                              .freeLifetimeQueries))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 20.0),
                                        child: Text(
                                          'Includes daily support, tested swaps, and all future updates.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                lineHeight: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (!valueOrDefault<bool>(
                                          currentUserDocument?.isPaid, false) &&
                                      (valueOrDefault(
                                              currentUserDocument
                                                  ?.lifetimeQueries,
                                              0) <
                                          homePageSubscriptionRecord
                                              .freeLifetimeQueries))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Text(
                                          'Another free one unlocks tomorrow - no rush.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                lineHeight: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    if (FFAppState().currentTime == '')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Splash_screen.png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
