import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';
import '../../theme/text_style_util.dart';
import '../margin_util.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Button({
    this.icon,
    required this.text,
    Key? key,
    this.width,
    this.height = 44,
    this.borderWidth = 1,
    this.elevation,
    required this.function,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.backgroundColor = AppColors.brandBlue,
    this.feedbackImpact = 1,
    this.withFeedback = true,
    this.loading = false,
    this.textStyle,
    this.iconPosition,
    this.disabled = false,
  }) : super(key: key);

  late String text;
  Widget? icon;
  double? width;
  double? height;
  double borderWidth;
  VoidCallback? function;
  Color? borderColor;
  Color? backgroundColor;
  bool? disabled;
  TextStyle? textStyle;
  double? elevation;
  double? borderRadius;
  Color? textColor;
  int? feedbackImpact;
  bool withFeedback;
  bool loading;
  String? iconPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? 454,
      child: TextButton(
        style: TextButton.styleFrom(
          disabledBackgroundColor: AppColors.greyE6,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          ),
          backgroundColor: function == null
              ? AppColors.greyE6
              : loading
                  ? AppColors.brandBlue
                  : backgroundColor,
          minimumSize: Size(width ?? 140, height ?? 60),
        ),
        onPressed: disabled == true
            ? null
            : loading
                ? null
                : () {
                    if (withFeedback) {
                      feedbackImpact == 1
                          ? HapticFeedback.lightImpact()
                          : feedbackImpact == 2
                              ? HapticFeedback.mediumImpact()
                              : HapticFeedback.heavyImpact();
                    }
                    if (function != null) {
                      function?.call();
                    }
                  },
        child: loading
            ? const CupertinoActivityIndicator(
                color: AppColors.brandBlue,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) const XMargin(20),
                  if (iconPosition == "left") icon ?? const SizedBox(),
                  Expanded(
                    flex: icon != null ? 1 : 3,
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            mediumStyle(
                              14,
                              function == null || disabled == true
                                  ? AppColors.grey54.withOpacity(0.60)
                                  : textColor ?? AppColors.white,
                            ),
                      ),
                    ),
                  ),
                  if (icon != null) const XMargin(10),
                  if (iconPosition == "right") icon ?? const SizedBox(),
                ],
              ),
      ),
    );
  }
}
