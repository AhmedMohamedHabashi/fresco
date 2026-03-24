import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/home/presentation/widgets/product_details.dart';
import 'package:fresco/feature/home/presentation/widgets/product_item_img.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.isFavorite, this.onTapFavorite});
  final bool isFavorite;
  final void Function()? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      height: 210.h,
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProductItemImage(
            isFavorite: isFavorite,
            onTapFavorite: onTapFavorite,
          ),
          const ProductDetails(),
        ],
      ),
    );
  }
}
