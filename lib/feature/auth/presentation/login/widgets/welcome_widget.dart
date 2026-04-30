import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class WelcomeWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const WelcomeWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text(title, style: AppTextStyle.bodyText24),
            Text(subtitle, style: AppTextStyle.bodyText16),
          ],
        ),
      ),
    );
  }
}
