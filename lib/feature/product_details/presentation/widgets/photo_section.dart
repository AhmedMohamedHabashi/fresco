import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class PhotoSection extends StatelessWidget {
  final ListModel product;
  final bool isFavorite;
  final VoidCallback? onTapFavorite;

  const PhotoSection({
    super.key,
    required this.product,
    required this.isFavorite,
    this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250.h,
          decoration: BoxDecoration(
            color: AppColors.mediumGrey,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.08),
                blurRadius: 12.r,
                offset: Offset(0, 6.r),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: onTapFavorite,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
