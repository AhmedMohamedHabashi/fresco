import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class DescriptionSection extends StatelessWidget {
  final ListModel product;

  const DescriptionSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: AppTextStyle.bodyText18.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6.h),

        Text(
          product.subtitle, // 👈 استخدمنا subtitle كـ description
          style: AppTextStyle.bodyText14.copyWith(
            color: AppColors.mainColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
