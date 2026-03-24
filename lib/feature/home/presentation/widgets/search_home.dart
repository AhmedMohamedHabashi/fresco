import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: "Search in Store",
          hintStyle: AppTextStyle.bodyText14.copyWith(
            color: AppColors.mediumGrey,
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
        ),
        style: AppTextStyle.bodyText16.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
