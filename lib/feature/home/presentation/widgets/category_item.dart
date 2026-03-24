import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Column(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundColor: AppColors.white,
            child: Icon(Icons.fastfood, color: AppColors.primaryColor),
          ),
          SizedBox(height: 5.h),
          Text(
            "Food",
            style: AppTextStyle.bodyText14.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
