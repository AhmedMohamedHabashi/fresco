import 'package:flutter/material.dart';
import 'package:fresco/core/shared/add_to_cart.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'quantity_selector.dart';
// import '../../../../core/shared/add_to_cart.dart';

class ItemActions extends StatelessWidget {
  final String price, oldPrice;
  final bool isCart;

  const ItemActions({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.isCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price,
              style: AppTextStyle.bodyText16.copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!isCart)
              Text(
                oldPrice,
                style: AppTextStyle.bodyText14.copyWith(
                  color: AppColors.mediumGrey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),

        // ق (ينادي على الملفات المنفصلة )
        isCart ? const QuantitySelector() : const AddToCartButton(),
      ],
    );
  }
}
