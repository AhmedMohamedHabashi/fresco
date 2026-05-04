import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class SizeSection extends StatelessWidget {
  const SizeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: AppTextStyle.bodyText18.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            _sizeText("38"),
            _sizeText("39"),
            _sizeSelected("40"),
            _sizeText("41"),
            _sizeText("42"),
          ],
        ),
      ],
    );
  }

  Widget _sizeText(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Text(
        text,
        style: AppTextStyle.bodyText14.copyWith(color: AppColors.textColor),
      ),
    );
  }

  Widget _sizeSelected(String text) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: CircleAvatar(
        radius: 18.r,
        backgroundColor: AppColors.mainColor, // اللون الأزرق بتاعك
        child: Text(
          text,
          style: AppTextStyle.bodyText14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
