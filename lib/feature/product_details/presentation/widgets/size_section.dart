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
          children: const [
            _SizeItem(text: "38"),
            _SizeItem(text: "39"),
            _SizeItem(text: "40", selected: true),
            _SizeItem(text: "41"),
            _SizeItem(text: "42"),
          ],
        ),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  final String text;
  final bool selected;

  const _SizeItem({required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: CircleAvatar(
          radius: 18.r,
          backgroundColor: AppColors.mainColor,
          child: Text(
            text,
            style: AppTextStyle.bodyText14.copyWith(color: Colors.white),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Text(
        text,
        style: AppTextStyle.bodyText14.copyWith(color: AppColors.textColor),
      ),
    );
  }
}
