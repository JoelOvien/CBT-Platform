// ignore_for_file: avoid_dynamic_calls

import 'dart:developer' as dev;

import 'package:cbt_platform/utilities/snack_bar_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';

class Helpers {
  static void closeKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context); // SHOULD BE builderContext
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static int getMonthSizeBetweenDates2(DateTime initialDate, DateTime endDate) {
    final difference = endDate.difference(initialDate);

    final differenceInWeeks = difference.inDays ~/ 7;
    return differenceInWeeks;
  }

  static Future<void> copyToClipboard({
    required BuildContext context,
    required String copyValue,
    String? snackBarMessage,
  }) {
    return Clipboard.setData(ClipboardData(text: copyValue)).then((_) {
      SnackbarUtil.showSnack(context, "Copied!");
    });
  }

  static void sendFeedback({int level = 1}) {
    level == 1
        ? HapticFeedback.lightImpact()
        : level == 2
            ? HapticFeedback.mediumImpact()
            : HapticFeedback.heavyImpact();
  }

  static void logc(Object o, {bool error = false}) {
    if (kDebugMode) {
      if (error) {
        dev.log("🐛 => $o");
      } else {
        dev.log("✅ => $o");
      }
    }
  }

  static String parseError(dynamic exception) {
    try {
      final List<String> errorTitles = exception.message.keys.toList();
      final error = errorTitles.map((e) => "${exception.message[e][0]}\n").toList().toString();
      return error.replaceAll(RegExp('[^A-Za-z  \n]'), '');
    } catch (e) {
      return exception.toString();
    }
  }
}
