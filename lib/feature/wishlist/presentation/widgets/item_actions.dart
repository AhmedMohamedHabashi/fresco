import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'quantity_selector.dart';
import '../../../../core/shared/add_to_cart.dart';

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
              style: const TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            if (!isCart)
              Text(
                oldPrice,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
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
