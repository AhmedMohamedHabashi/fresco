import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({
    super.key,
    required this.image,
    required this.isFavorite,
    this.onTapFavorite,
  });

  final String image;
  final bool isFavorite;
  final void Function()? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              image, // 👈 بدل الثابت
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          top: 4.h,
          right: 4.w,
          child: Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primaryColor,
                ),
                onPressed: onTapFavorite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
