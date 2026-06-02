import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'product_item_img.dart';
import 'product_details.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback? onTapFavorite;
  final VoidCallback? onTap;

  const ProductItem({
    super.key,
    required this.product,
    required this.isFavorite,
    this.onTapFavorite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Container(
          height: 240.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.lightBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductItemImage(
                image: product.image,
                isFavorite: isFavorite,
                onTapFavorite: onTapFavorite,
              ),
              Expanded(child: ProductDetails(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}
