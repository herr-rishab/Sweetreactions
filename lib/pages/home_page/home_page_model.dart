import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String? chatID;

  bool hide = true;

  String? que;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (time)] action in HomePage widget.
  ApiCallResponse? time;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  SubscriptionRecord? subscription;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ask)] action in IconButton widget.
  ApiCallResponse? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
