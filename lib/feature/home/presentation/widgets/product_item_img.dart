import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/shimmer/product_image_shimmer.dart';
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
          height: 105.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              image.isNotEmpty ? image : "https://picsum.photos/200",
              fit: BoxFit.contain,

              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: ProductImageShimmer());
              },

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.white,
                  child: Icon(
                    size: 30.sp,
                    Icons.image_not_supported,
                    color: AppColors.primaryColor,
                  ),
                );
              },
            ),
          ),
        ),

        Positioned(
          top: 6.h,
          right: 6.w,
          child: Container(
            height: 28.h,
            width: 28.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 18.sp,
                color: AppColors.primaryColor,
              ),
              onPressed: onTapFavorite,
            ),
          ),
        ),
      ],
    );
  }
}
