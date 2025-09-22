// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({
    super.key,
    this.width,
    this.height,
    this.reportedMessage,
  });

  final double? width;
  final double? height;
  final String? reportedMessage;

  @override
  State<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  String? _selectedReason;
  bool _isSubmitting = false;
  bool _isSubmitted = false;

  final List<String> _reasons = [
    'Inaccurate or False Information',
    'Harmful or Dangerous Advice',
    'Hateful or Offensive Content',
    'Other',
  ];

  Future<void> _submitReport() async {
    if (_selectedReason == null || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is not authenticated.');
      }

      final reportData = {
        'reportedMessage':
            widget.reportedMessage ?? 'No message content provided.',
        'reason': _selectedReason,
        'userId': user.uid,
        'userEmail': user.email, // Optional: useful for follow-up
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'New', // Optional: for tracking review status
      };

      await FirebaseFirestore.instance
          .collection('UserReports')
          .add(reportData);

      setState(() => _isSubmitted = true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit report. Please try again.'),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _isSubmitted ? _buildSuccessView(theme) : _buildForm(theme),
      ),
    );
  }

  Widget _buildForm(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report Content',
          style: theme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Please select a reason for reporting this message. Your feedback helps us improve.',
            style: theme.bodyMedium,
          ),
        ),
        Divider(height: 24, thickness: 1, color: theme.alternate),
        ..._reasons.map((reason) {
          return RadioListTile<String>(
            title: Text(reason, style: theme.bodyLarge),
            value: reason,
            groupValue: _selectedReason,
            onChanged: (value) {
              setState(() {
                _selectedReason = value;
              });
            },
            activeColor: theme.primary,
            contentPadding: EdgeInsets.zero,
          );
        }).toList(),
        SizedBox(height: 24.0),
        ElevatedButton(
          onPressed:
              _selectedReason == null || _isSubmitting ? null : _submitReport,
          child: _isSubmitting
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text('Submit Report'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: theme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessView(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Icon(
          Icons.check_circle_outline_rounded,
          color: theme.success,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Thank You!',
            style: theme.headlineMedium,
          ),
        ),
        Text(
          'Your report has been submitted and will be reviewed.',
          textAlign: TextAlign.center,
          style: theme.bodyMedium,
        ),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: theme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }
}
