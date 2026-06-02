import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:fresco/feature/home/presentation/cubit/favorites_cubit.dart';

class PhotoSection extends StatelessWidget {
  final Product product;

  const PhotoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 12.r,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
              product.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          /// HEART BUTTON
          Positioned(
            top: 10.h,
            right: 10.w,
            child: BlocBuilder<FavoritesCubit, Set<int>>(
              builder: (context, favorites) {
                final isFav = favorites.contains(product.id);

                return GestureDetector(
                  onTap: () {
                    context.read<FavoritesCubit>().toggle(product.id);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
