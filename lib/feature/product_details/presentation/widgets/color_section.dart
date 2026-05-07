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

        SizedBox(height: 10.h),

        Wrap(
          children: const [
            _ColorCircle(color: AppColors.black),
            _ColorCircle(color: AppColors.red, selected: true),
            _ColorCircle(color: AppColors.lightBlue),
            _ColorCircle(color: AppColors.green),
            _ColorCircle(color: AppColors.CoralRed),
          ],
        ),
      ],
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool selected;

  const _ColorCircle({required this.color, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      width: 30.w,
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: selected
          ? const Icon(Icons.check, color: Colors.white, size: 16)
          : null,
    );
  }
}
