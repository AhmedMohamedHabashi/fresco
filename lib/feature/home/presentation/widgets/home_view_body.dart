import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/home/presentation/cubit/favorites_cubit.dart';
import 'package:fresco/feature/home/presentation/widgets/home_header.dart';
import 'package:fresco/feature/home/presentation/widgets/home_banner_image.dart';
import 'package:fresco/feature/home/presentation/widgets/products_list.dart';
import 'package:fresco/feature/home/presentation/widgets/section_title.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_cubit.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_state.dart';
import 'package:fresco/core/shared/shimmer/product_shimmer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            const HomeBannerImage(),
            const SectionTitle(title: 'Popular Products'),

            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const ProductShimmer();
                }

                if (state is ProductLoaded) {
                  return BlocBuilder<FavoritesCubit, Set<int>>(
                    builder: (context, favorites) {
                      return ProductsList(
                        products: state.products,
                        favorites: favorites,

                        onTapFavorite: (productId) {
                          context.read<FavoritesCubit>().toggle(productId);
                        },
                      );
                    },
                  );
                }
                if (state is ProductError) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 30.h,
                        horizontal: 20.w,
                      ),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColors.errMessage),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: AppColors.errMassgeText,
                            size: 40.sp,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.bodyText14.copyWith(
                              color: AppColors.errMassgeText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
