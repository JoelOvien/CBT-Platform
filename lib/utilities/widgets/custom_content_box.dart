import 'package:cbt_platform/theme/app_colors.dart';
import 'package:cbt_platform/theme/text_style_util.dart';
import 'package:cbt_platform/utilities/margin_util.dart';
import 'package:flutter/material.dart';

Widget customContentBox(String headingText, String bodyText) {
  return Container(
    height: 186,
    width: 293,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey200),
        borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.greyCont,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.abc),
                ),
              ),
              const XMargin(17),
              Text(
                headingText,
                style: mediumStyle(18, AppColors.black1E),
              )
            ],
          ),
          const YMargin(23),
          Text(
            bodyText,
            style: normalStyle(12, AppColors.grey68),
          ),
          const YMargin(19),
          Text(
            "Get Started",
            style: mediumStyle(12, AppColors.brandBlue),
          )
        ],
      ),
    ),
  );
}
