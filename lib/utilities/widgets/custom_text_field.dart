import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';
import '../../theme/text_style_util.dart';
import '../margin_util.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  Widget? prefixIcon;
  String? hintText;
  double? height, width;
  List<String>? autofillHint;
  TextInputType? keyboardType;
  List<TextInputFormatter>? formatters = [];
  Widget? suffixIcon;
  String? Function(String?)? validator;
  Function(String s)? onChanged;
  bool? enabled;
  bool hide;
  int? maxLines;
  TextStyle? style;
  TextStyle? hintStyle;
  Color? color;
  String? title;
  bool? hasBorder;
  int? maxLength;
  Color? fillColor;
  bool? readOnly;
  Function()? onTap;
  CustomTextField({
    Key? key,
    this.height = 50,
    this.width = 454,
    required this.controller,
    this.title,
    this.prefixIcon,
    this.hintText,
    this.autofillHint,
    this.hide = false,
    this.keyboardType,
    this.enabled = true,
    this.style,
    this.validator,
    this.formatters,
    this.onChanged,
    this.maxLines = 1,
    this.hintStyle,
    this.color,
    this.hasBorder = true,
    this.suffixIcon,
    this.maxLength,
    this.fillColor,
    this.readOnly = false,
    this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: mediumStyle(14, AppColors.grey54),
            )
          else
            const SizedBox.shrink(),
          const YMargin(8),
          SizedBox(
            height: maxLines == null ? 50 : null,
            child: Center(
              child: TextFormField(
                controller: controller,
                enabled: enabled,
                autofillHints: autofillHint,
                keyboardType: keyboardType,
                validator: validator,
                maxLines: maxLines,
                maxLength: maxLength,
                readOnly: readOnly ?? false,
                inputFormatters: formatters,
                onChanged: onChanged,
                obscureText: hide,
                onTap: onTap,
                style: style ?? normalStyle(12, AppColors.grey54),
                decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: fillColor != null,
                  errorStyle: normalStyle(
                    12,
                    AppColors.errorColor,
                  ),
                  border: hasBorder == false
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.grey54.withOpacity(0.50),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                  errorBorder: hasBorder == false
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.grey54.withOpacity(0.50),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: prefixIcon == null ? 20 : 8),
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      normalStyle(
                        11,
                        AppColors.grey54.withOpacity(0.50),
                      ),
                  prefixIcon: prefixIcon == null
                      ? null
                      : IntrinsicWidth(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              prefixIcon!,
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Colors.grey[400],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
