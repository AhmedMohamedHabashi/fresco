import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class CustomSearch extends StatelessWidget {
  final String hintText;

  final Color? borderColor;
  final double? borderWidth;
  final bool showBorder;
  final bool showShadow;

  const CustomSearch({
    super.key,
    required this.hintText,
    this.borderColor,
    this.borderWidth,
    this.showBorder = false,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.r),

        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.15),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        style: AppTextStyle.bodyText14.copyWith(color: AppColors.primaryColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.bodyText13.copyWith(
            color: AppColors.mediumGrey,
          ),

          prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),

          filled: true,
          fillColor: AppColors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: showBorder
                ? BorderSide(
                    color: borderColor ?? AppColors.primaryColor,
                    width: borderWidth ?? 1.w,
                  )
                : BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: showBorder
                ? BorderSide(color: borderColor ?? AppColors.primaryColor)
                : BorderSide.none,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
