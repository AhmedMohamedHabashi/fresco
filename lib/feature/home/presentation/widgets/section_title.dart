import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    this.isHeader = false,
    required this.title,
    this.horizontalPadding = 16,
    this.verticalPadding = 5,
  });
  final bool isHeader;
  final String title;
  final double horizontalPadding;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w,
        vertical: verticalPadding.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.bodyText18.copyWith(
              color: isHeader ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          if (!isHeader)
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}
