import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/limit_reminder_widget.dart';
import '/components/report_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'response_model.dart';
export 'response_model.dart';

class ResponseWidget extends StatefulWidget {
  const ResponseWidget({
    super.key,
    required this.chatID,
    bool? hasFollowUp,
  }) : this.hasFollowUp = hasFollowUp ?? true;

  final String? chatID;
  final bool hasFollowUp;

  static String routeName = 'Response';
  static String routePath = '/response';

  @override
  State<ResponseWidget> createState() => _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  late ResponseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResponseModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        List<SubscriptionRecord> responseSubscriptionRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final responseSubscriptionRecord =
            responseSubscriptionRecordList.isNotEmpty
                ? responseSubscriptionRecordList.first
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
              child: StreamBuilder<List<ChatsRecord>>(
                stream: queryChatsRecord(
                  queryBuilder: (chatsRecord) => chatsRecord
                      .where(
                        'uid',
                        isEqualTo: currentUserUid,
                      )
                      .where(
                        'chatID',
                        isEqualTo: widget.chatID,
                      ),
                  singleRecord: true,
                ),
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
                  List<ChatsRecord> columnChatsRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnChatsRecord = columnChatsRecordList.isNotEmpty
                      ? columnChatsRecordList.first
                      : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 20.0, 8.0, 0.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(ChatHistoryWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 28.0,
                                        ),
                                      ),
                                      Text(
                                        'Chats',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'sweetreactions.ai',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                        lineHeight: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 16.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(HomePageWidget.routeName);
                                    },
                                    child: Icon(
                                      FFIcons.kgroup,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 0.0),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    controller: _model.scroll,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            final chats = columnChatsRecord
                                                    ?.content
                                                    .toList() ??
                                                [];

                                            return SingleChildScrollView(
                                              controller: _model.main,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    chats.length, (chatsIndex) {
                                                  final chatsItem =
                                                      chats[chatsIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Text(
                                                            currentUserDisplayName,
                                                            textAlign: TextAlign
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
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
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFE8E5DE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Text(
                                                            chatsItem
                                                                .userContent,
                                                            textAlign:
                                                                TextAlign.start,
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
                                                                  color: Color(
                                                                      0xFF262624),
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    12.0,
                                                                    8.0,
                                                                    16.0),
                                                        child: custom_widgets
                                                            .Response(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          input: chatsItem
                                                              .assistantContent,
                                                          onReportAction:
                                                              () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        ReportWidget(
                                                                      reportedMessage:
                                                                          chatsItem
                                                                              .assistantContent,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                        if (_model.isLoading)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Lottie.network(
                                              'https://lottie.host/60d11427-b041-4570-8d70-e685aca958d0/mWzCmkzjXi.json',
                                              width: 48.0,
                                              height: 40.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                        if ((!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (responseSubscriptionRecord!
                                                        .freeDailyQueries <=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.noOfQueries,
                                                        0)) &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.lifetimeQueries,
                                                        0) <
                                                    responseSubscriptionRecord
                                                        .freeLifetimeQueries)) ||
                                            (valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (responseSubscriptionRecord!
                                                        .paidMonthlyQueries <=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.noOfQueries,
                                                        0))))
                                          AuthUserStreamWidget(
                                            builder: (context) => SizedBox(
                                              width: 320.0,
                                              child: Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                          ),
                                        if ((!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (responseSubscriptionRecord!
                                                        .freeDailyQueries <=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.noOfQueries,
                                                        0))) ||
                                            (valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false) &&
                                                (responseSubscriptionRecord!
                                                        .paidMonthlyQueries <=
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.noOfQueries,
                                                        0))))
                                          AuthUserStreamWidget(
                                            builder: (context) => Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD97B5C),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (!valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isPaid,
                                                                  false) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.lifetimeQueries,
                                                                      0) ==
                                                                  responseSubscriptionRecord
                                                                      .freeLifetimeQueries))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'You’ve used all ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF262624),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            lineHeight:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: responseSubscriptionRecord
                                                                          .freeLifetimeQueries
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          ' free meal optimizations',
                                                                      style:
                                                                          TextStyle(),
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
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF262624),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          if (!valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isPaid,
                                                                  false) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.lifetimeQueries,
                                                                      0) ==
                                                                  responseSubscriptionRecord
                                                                      .freeLifetimeQueries))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          '\nThat’s ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF262624),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            lineHeight:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        responseSubscriptionRecord
                                                                            .freeLifetimeQueries
                                                                            .toString(),
                                                                        '7',
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          ' smarter meals already — nicely done.\nTo keep going, unlock unlimited access.',
                                                                      style:
                                                                          TextStyle(),
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
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF262624),
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
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          if (!valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isPaid,
                                                                  false) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.lifetimeQueries,
                                                                      0) <
                                                                  responseSubscriptionRecord
                                                                      .freeLifetimeQueries))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'That’s your free optimization for today.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF262624),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            lineHeight:
                                                                                0.0,
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
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          if (!valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isPaid,
                                                                  false) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.lifetimeQueries,
                                                                      0) <
                                                                  responseSubscriptionRecord
                                                                      .freeLifetimeQueries))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          '\nWant smart swaps for every meal?\nUnlock unlimited access — no calorie counting, no crash diets.',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF262624),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            lineHeight:
                                                                                0.0,
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
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
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
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          if (valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.isPaid,
                                                              false))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'You’ve maxed out your plan for this month',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF262624),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            lineHeight:
                                                                                0.0,
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
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          if (valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.isPaid,
                                                              false))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          '\nThat’s ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF262624),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                            lineHeight:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        responseSubscriptionRecord
                                                                            .paidMonthlyQueries
                                                                            .toString(),
                                                                        '300',
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          ' optimized meals — seriously impressive. You’ve hit the fair usage limit for your plan. It resets on [July 1, 2025] — just a short break till then.',
                                                                      style:
                                                                          TextStyle(),
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
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF262624),
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
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (!valueOrDefault<bool>(
                                                    currentUserDocument?.isPaid,
                                                    false))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 24.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            BuySubscriptionWidget
                                                                .routeName);
                                                      },
                                                      text:
                                                          'Upgrade for Unlimited Access',
                                                      options: FFButtonOptions(
                                                        width: 280.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconAlignment:
                                                            IconAlignment.end,
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .hankenGrotesk(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ),
                                                if (!valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isPaid,
                                                        false) &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.lifetimeQueries,
                                                            0) ==
                                                        responseSubscriptionRecord
                                                            .freeLifetimeQueries))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  20.0),
                                                      child: Text(
                                                        'Includes daily support, tested swaps, and all future updates.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              lineHeight: 0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                if (!valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isPaid,
                                                        false) &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.lifetimeQueries,
                                                            0) <
                                                        responseSubscriptionRecord
                                                            .freeLifetimeQueries))
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
                                                                  0.0,
                                                                  20.0),
                                                      child: Text(
                                                        'Another free one unlocks tomorrow - no rush.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
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
                      if (widget.hasFollowUp &&
                          ((!valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false) &&
                                  (responseSubscriptionRecord!
                                          .freeDailyQueries >
                                      valueOrDefault(
                                          currentUserDocument?.noOfQueries,
                                          0)) &&
                                  (valueOrDefault(
                                          currentUserDocument?.lifetimeQueries,
                                          0) <
                                      responseSubscriptionRecord
                                          .freeLifetimeQueries)) ||
                              (valueOrDefault<bool>(
                                      currentUserDocument?.isPaid, false) &&
                                  (responseSubscriptionRecord!
                                          .paidMonthlyQueries >
                                      valueOrDefault(
                                          currentUserDocument?.noOfQueries,
                                          0)))))
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: double.infinity,
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).customColor1,
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
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                      hintText: 'Reply to sweetreactions.ai',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
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
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 30.0,
                                          buttonSize: 36.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          icon: Icon(
                                            Icons.send_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 16.0,
                                          ),
                                          onPressed: () async {
                                            _model.isLoading = true;
                                            _model.que =
                                                _model.textController.text;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                            await _model.scroll?.animateTo(
                                              _model.scroll!.position
                                                  .maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.noOfQueries,
                                                    0) ==
                                                responseSubscriptionRecord
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
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
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
                                            unawaited(
                                              () async {}(),
                                            );
                                            _model.output = await AskCall.call(
                                              query: _model.que,
                                              chatHistoryJson:
                                                  functions.extractChatContext(
                                                      columnChatsRecord!.content
                                                          .toList()),
                                            );

                                            if (AskCall.limit(
                                                  (_model.output?.jsonBody ??
                                                      ''),
                                                ) ==
                                                true) {
                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'noOfQueries':
                                                        FieldValue.increment(1),
                                                    'lifetimeQueries':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                            }

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              lastQueryTime:
                                                  FFAppState().currentTime,
                                            ));

                                            await columnChatsRecord.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'content':
                                                      FieldValue.arrayUnion([
                                                    getChatCompFirestoreData(
                                                      updateChatCompStruct(
                                                        ChatCompStruct(
                                                          userContent:
                                                              _model.que,
                                                          assistantContent:
                                                              AskCall.response(
                                                            (_model.output
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                        ),
                                                        clearUnsetFields: false,
                                                      ),
                                                      true,
                                                    )
                                                  ]),
                                                },
                                              ),
                                            });
                                            _model.isLoading = false;
                                            safeSetState(() {});

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
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
