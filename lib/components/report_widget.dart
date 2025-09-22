import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    this.reportedMessage,
  });

  final String? reportedMessage;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  late ReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: custom_widgets.ReportBottomSheet(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        reportedMessage: widget.reportedMessage,
      ),
    );
  }
}
