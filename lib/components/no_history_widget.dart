import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'no_history_model.dart';
export 'no_history_model.dart';

class NoHistoryWidget extends StatefulWidget {
  const NoHistoryWidget({super.key});

  @override
  State<NoHistoryWidget> createState() => _NoHistoryWidgetState();
}

class _NoHistoryWidgetState extends State<NoHistoryWidget> {
  late NoHistoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoHistoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'No Past Chats',
      maxLines: 1,
      style: FlutterFlowTheme.of(context).titleLarge.override(
            font: GoogleFonts.hankenGrotesk(
              fontWeight: FontWeight.w600,
              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
            ),
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 16.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
          ),
    );
  }
}
