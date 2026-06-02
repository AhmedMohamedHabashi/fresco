import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

class DescriptionSection extends StatelessWidget {
  final Product product;

  const DescriptionSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Description"),

        SizedBox(height: 6.h),

        Text(
          product.subtitle,
          style: AppTextStyle.bodyText14.copyWith(
            color: AppColors.mainColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
