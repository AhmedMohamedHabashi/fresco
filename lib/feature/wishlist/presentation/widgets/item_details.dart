import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class ItemDetails extends StatelessWidget {
  final String title, color, size;
  final bool isCart;
  const ItemDetails({
    super.key,
    required this.title,
    required this.isCart,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Icon(
              isCart ? Icons.delete_outline : Icons.favorite,
              color: AppColors.mainColor,
            ),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFFBC3018),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              isCart ? "$color | Size: $size" : color,
              style: const TextStyle(
                color: AppColors.descriptionColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
