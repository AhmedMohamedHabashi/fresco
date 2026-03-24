import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning', style: AppTextStyle.bodyText16),
            Text(
              'Ahmed',
              style: AppTextStyle.bodyText18.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 30.sp,
              color: AppColors.white,
            ),
            Positioned(
              right: -4.w,
              top: -4.h,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(minWidth: 14.w, minHeight: 14.h),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
