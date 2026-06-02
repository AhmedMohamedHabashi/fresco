import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

class NamePriceSection extends StatelessWidget {
  final Product product;

  const NamePriceSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product.title,
            style: AppTextStyle.bodyText18.copyWith(color: AppColors.mainColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        Text(
          "${product.price} EGP",
          style: AppTextStyle.bodyText18.copyWith(color: AppColors.mainColor),
        ),
      ],
    );
  }
}
