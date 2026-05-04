import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class CheckoutSection extends StatelessWidget {
  final String text;
  final String price;
  final bool isIconFirst;
  final IconData icon;

  const CheckoutSection({
    super.key,
    required this.text,
    required this.price,
    required this.isIconFirst,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Row(
        children: [
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total price",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.mainColor.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),

          SizedBox(width: 30.w),

          // Button
          Expanded(
            child: Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: isIconFirst
                    ? [
                        Icon(icon, color: AppColors.white, size: 20.sp),
                        SizedBox(width: 15.w),
                        Text(
                          text,
                          style: AppTextStyle.bodyText18.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ]
                    : [
                        Text(
                          text,
                          style: AppTextStyle.bodyText18.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Icon(icon, color: AppColors.white, size: 20.sp),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
