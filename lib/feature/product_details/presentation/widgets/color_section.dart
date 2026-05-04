import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: AppTextStyle.bodyText18.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 8.h),

        Row(
          children: [
            _colorCircle(AppColors.black),
            _colorCircle(AppColors.red, selected: true),
            _colorCircle(AppColors.lightBlue),
            _colorCircle(AppColors.green),
            _colorCircle(AppColors.CoralRed),
          ],
        ),
      ],
    );
  }
}

Widget _colorCircle(Color color, {bool selected = false}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    width: 30.w,
    height: 30.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    child: selected
        ? Icon(Icons.check, color: Colors.white, size: 16.sp)
        : null,
  );
}
