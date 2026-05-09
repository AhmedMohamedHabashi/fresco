import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

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
                style: AppTextStyle.bodyText18.copyWith(
                  color: AppColors.mainColor,
                ),
              ),
            ),
            Icon(
              isCart ? Icons.delete_outline : Icons.favorite,
              color: AppColors.mainColor,
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            Container(
              width: 12.w,
              height: 12.h,
              decoration: const BoxDecoration(
                color: Color(0xFFBC3018),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              isCart ? "$color | Size: $size" : color,
              style: AppTextStyle.bodyText14.copyWith(
                color: AppColors.descriptionColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
