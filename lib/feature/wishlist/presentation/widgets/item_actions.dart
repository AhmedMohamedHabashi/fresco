import 'package:flutter/material.dart';
import 'package:fresco/core/shared/add_to_cart.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'quantity_selector.dart';

class ItemActions extends StatelessWidget {
  final double price, oldPrice;
  final bool isCart;
  final Product product;

  const ItemActions({
    super.key,
    required this.price,
    required this.oldPrice,
    required this.isCart,
    required this.product,
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
              "\$ $price",
              style: AppTextStyle.bodyText16.copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            if (!isCart)
              Text(
                "\$${oldPrice.toStringAsFixed(2)}",
                style: AppTextStyle.bodyText12.copyWith(
                  color: AppColors.mediumGrey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),

        isCart ? const QuantitySelector() : AddToCartButton(product: product),
      ],
    );
  }
}
