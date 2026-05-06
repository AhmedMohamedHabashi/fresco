import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  final String title;
  final String subtitle;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Text(
            title,
            style: AppTextStyle.bodyText14.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              Text(
                subtitle,
                style: AppTextStyle.bodyText12.copyWith(
                  color: AppColors.mediumGrey,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 4.w)),
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primaryColor,
                size: 12.sp,
              ),
            ],
          ),

          // 🔹 Price
          Row(
            children: [
              Text(
                price,
                style: AppTextStyle.bodyText14.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                rating,
                style: AppTextStyle.bodyText12.copyWith(color: AppColors.black),
              ),
              Icon(
                Icons.star,
                color: AppColors.yellow,
                size: AppTextStyle.bodyText12
                    .copyWith(color: AppColors.black)
                    .fontSize,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  AssetsHelper.addToCart,
                  height: 32.h,
                  width: 32.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
