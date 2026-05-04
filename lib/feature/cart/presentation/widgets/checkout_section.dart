import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total price:",
                style: AppTextStyle.bodyText16.copyWith(
                  color: AppColors.mainColor.withOpacity(0.75),
                ),
              ),

              SizedBox(height: 4.h),
              Text(
                "EGP 10,500",
                style: AppTextStyle.bodyText20.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 30.w),
          // Check Out Button
          Expanded(
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Check Out",
                    style: AppTextStyle.bodyText18.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
