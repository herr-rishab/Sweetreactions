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

import 'package:flutter/cupertino.dart';

class PickerWeight extends StatefulWidget {
  const PickerWeight({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PickerWeight> createState() => _PickerWeightState();
}

class _PickerWeightState extends State<PickerWeight> {
  // Add "--" placeholder at the beginning of the list
  final List<String> weights = [
    "--",
    ...List.generate(171, (index) => "${30 + index} kg")
  ];

  int selectedWeight = 0; // "--" selected by default

  @override
  void initState() {
    super.initState();
    _updateAppState(); // Set initial weight in app state
  }

  void _updateAppState() {
    final weightValue = weights[selectedWeight];
    FFAppState().update(() {
      // Store empty string if no valid weight is selected
      FFAppState().weight = weightValue != "--" ? weightValue : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: () => _showWeightPicker(context),
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          weights[selectedWeight],
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontSize: 20.0,
                color: textColor,
              ),
        ),
      ),
    );
  }

  void _showWeightPicker(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        color: backgroundColor,
        child: Column(
          children: [
            // Done Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  "Done",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Outfit',
                    color: Color(0xFF4C7B5F),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            // Cupertino Picker
            Expanded(
              child: CupertinoPicker(
                itemExtent: 32,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedWeight),
                onSelectedItemChanged: (index) {
                  setState(() => selectedWeight = index);
                  _updateAppState();
                },
                backgroundColor: backgroundColor,
                children: weights
                    .map((w) => Center(
                          child: Text(
                            w,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Outfit',
                              color: textColor,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
