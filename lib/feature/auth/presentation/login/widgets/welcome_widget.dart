import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class WelcomeWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool hotizontalPadding;
  final bool colorText;
  const WelcomeWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.hotizontalPadding,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hotizontalPadding ? 16.w : 0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text(
              title,
              style: AppTextStyle.bodyText22.copyWith(
                fontWeight: FontWeight.bold,
                color: colorText ? AppColors.primaryColor : AppColors.white,
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyle.bodyText14.copyWith(
                color: colorText ? AppColors.primaryColor : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
