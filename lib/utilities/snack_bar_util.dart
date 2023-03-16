import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SnackbarUtil {
  static void showSnack(
    BuildContext context,
    String message, {
    bool top = true,
    Color? bkgColor,
  }) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: bkgColor ?? AppColors.successGreen,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: top ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }

  static void showErrorSnack(
    BuildContext context,
    String message, {
    bool top = true,
    String callBackText = "Okay",
    VoidCallback? callback,
    Color? bkgColor,
  }) {
    Flushbar(
      message: "$message ",
      duration: const Duration(seconds: 3),
      backgroundColor: bkgColor ?? AppColors.errorColor,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: top ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }
}
