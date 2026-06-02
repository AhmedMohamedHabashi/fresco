import 'package:flutter/material.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class TextHighlighter {
  static TextSpan highlight({required String text, required String query}) {
    if (query.isEmpty) {
      return TextSpan(
        text: text,
        style: AppTextStyle.bodyText16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      );
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();

    final start = lowerText.indexOf(lowerQuery);

    if (start == -1) {
      return TextSpan(
        text: text,
        style: AppTextStyle.bodyText16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      );
    }

    final end = start + query.length;

    return TextSpan(
      children: [
        TextSpan(
          text: text.substring(0, start),
          style: AppTextStyle.bodyText16.copyWith(color: AppColors.black),
        ),
        TextSpan(
          text: text.substring(start, end),
          style: AppTextStyle.bodyText16.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.coralRed,
          ),
        ),
        TextSpan(
          text: text.substring(end),
          style: AppTextStyle.bodyText16.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
