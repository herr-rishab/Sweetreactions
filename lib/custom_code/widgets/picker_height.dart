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

class PickerHeight extends StatefulWidget {
  const PickerHeight({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PickerHeight> createState() => _PickerHeightState();
}

class _PickerHeightState extends State<PickerHeight> {
  // Include "--" as the initial item
  final List<String> centimeters = [
    "--",
    ...List.generate(151, (index) => "${100 + index} cm")
  ];

  int selectedCmIndex = 0; // "--" is default selected

  @override
  void initState() {
    super.initState();
    _updateAppState(); // Set initial app state
  }

  void _updateAppState() {
    final cmValue = centimeters[selectedCmIndex];
    FFAppState().update(() {
      // Store as empty string if placeholder is selected
      FFAppState().height = cmValue != "--" ? cmValue : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: () => _showHeightPicker(context),
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
          centimeters[selectedCmIndex],
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontSize: 20.0,
                color: textColor,
              ),
        ),
      ),
    );
  }

  void _showHeightPicker(BuildContext context) {
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
            // Done button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Outfit',
                    color: const Color(0xFF4C7B5F),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            // Picker
            Expanded(
              child: CupertinoPicker(
                itemExtent: 32,
                scrollController:
                    FixedExtentScrollController(initialItem: selectedCmIndex),
                onSelectedItemChanged: (index) {
                  setState(() => selectedCmIndex = index);
                  _updateAppState();
                },
                backgroundColor: backgroundColor,
                children: centimeters
                    .map((cm) => Center(
                          child: Text(
                            cm,
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
