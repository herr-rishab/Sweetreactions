import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'response_widget.dart' show ResponseWidget;
import 'package:flutter/material.dart';

class ResponseModel extends FlutterFlowModel<ResponseWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String? que;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Scroll widget.
  ScrollController? scroll;
  // State field(s) for Main widget.
  ScrollController? main;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ask)] action in IconButton widget.
  ApiCallResponse? output;

  @override
  void initState(BuildContext context) {
    scroll = ScrollController();
    main = ScrollController();
  }

  @override
  void dispose() {
    scroll?.dispose();
    main?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
