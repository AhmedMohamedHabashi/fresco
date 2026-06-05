import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زرار الناقص (-)
          GestureDetector(
            onTap: () {
              setState(() {
                if (quantity > 1) {
                  quantity--;
                }
              });
            },
            child: Icon(
              Icons.remove_circle_outline,
              color: AppColors.white,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 15.w),

          Text(
            "$quantity",
            style: AppTextStyle.bodyText16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(width: 15.w),

          GestureDetector(
            onTap: () {
              setState(() {
                quantity++;
              });
            },
            child: Icon(
              Icons.add_circle_outline,
              color: AppColors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
