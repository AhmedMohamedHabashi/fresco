import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

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
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20),
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
            child: const Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),

          Text(
            "$quantity",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(width: 15),

          // زرار الزائد (+)
          GestureDetector(
            onTap: () {
              setState(() {
                quantity++;
              });
            },
            child: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
