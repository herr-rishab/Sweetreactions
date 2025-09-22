import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String fixEncoding(String input) {
  try {
    // Step 1: Re-encode with latin1 and decode with utf8 to fix weird characters
    final bytes = latin1.encode(input);
    String decoded = utf8.decode(bytes);

    // Step 2: Remove Markdown formatting (** and #)
    decoded = decoded.replaceAll('**', '');
    decoded = decoded.replaceAll('#', '');

    return decoded;
  } catch (e) {
    // Fallback: Just remove ** and # even if decoding fails
    return input.replaceAll('**', '').replaceAll('#', '');
  }
}

bool limitCheck(
  String inputTime,
  String currentTime,
) {
  try {
    DateTime inputDateTime = DateTime.parse(inputTime);
    DateTime currentDateTime = DateTime.parse(currentTime);

    DateTime today = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);
    DateTime inputDate =
        DateTime(inputDateTime.year, inputDateTime.month, inputDateTime.day);

    DateTime yesterday = today.subtract(const Duration(days: 1));

    return inputDate.isAtSameMomentAs(yesterday);
  } catch (e) {
    return false;
  }
}

dynamic extractChatContext(List<ChatCompStruct> chats) {
  final result = chats
      .map((chat) {
        return [
          {"role": "user", "content": chat.userContent},
          {"role": "assistant", "content": chat.assistantContent}
        ];
      })
      .expand((pair) => pair)
      .toList();

  return result;
}
