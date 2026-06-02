import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class ItemDetails extends StatelessWidget {
  final String title, subtitle;
  final bool isCart;
  final VoidCallback? onDelete;
  String getShortText(String text) {
    final words = text.split(' ');
    if (words.length <= 3) return text;
    return '${words[0]} ${words[1]} ${words[2]}';
  }

  const ItemDetails({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isCart,
    required this.onDelete,
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
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.bodyText18.copyWith(
                  color: AppColors.mainColor,
                ),
              ),
            ),

            GestureDetector(
              onTap: isCart ? onDelete : null,
              child: Icon(
                isCart ? Icons.delete_outline : Icons.favorite,
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        Row(
          children: [
            Text(
              getShortText(subtitle),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.bodyText14.copyWith(
                color: AppColors.descriptionColor,
              ),
            ),

            SizedBox(width: 6.w),

            const Icon(
              Icons.check_circle_rounded,
              size: 14,
              color: AppColors.mainColor,
            ),
          ],
        ),
      ],
    );
  }
}
