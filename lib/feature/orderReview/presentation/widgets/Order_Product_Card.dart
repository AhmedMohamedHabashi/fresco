import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

class OrderProductCard extends StatelessWidget {
  final Product product;
  String getShortText(String text) {
    final words = text.split(' ');
    if (words.length <= 4) return text;
    return '${words[0]} ${words[1]} ${words[2]} ${words[3]}';
  }

  const OrderProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              product.image,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80.w,
                  height: 80.h,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),

          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getShortText(product.subtitle),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.bodyText16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      getShortText(product.subtitle),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodyText12.copyWith(
                        color: AppColors.mediumGrey,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 14,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),

                SizedBox(height: 8.h),
                Text(
                  "\$${product.price.toStringAsFixed(2)}",
                  style: AppTextStyle.bodyText14.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
