import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/shimmer/product_image_shimmer.dart';
import 'package:fresco/core/utils/helpers/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_cubit.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_state.dart';
import 'package:fresco/feature/home/presentation/cubit/favorites_cubit.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';
import 'package:lottie/lottie.dart';

class WishlistScreenBody extends StatelessWidget {
  const WishlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, productState) {
          if (productState is ProductLoading) {
            return const Center(child: ProductImageShimmer());
          }

          if (productState is ProductLoaded) {
            return BlocBuilder<FavoritesCubit, Set<int>>(
              builder: (context, favorites) {
                final wishlistProducts = productState.products
                    .where((p) => favorites.contains(p.id))
                    .toList();

                if (wishlistProducts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(AssetsHelper.emptyWishlist, repeat: true),
                        SizedBox(height: 12),
                        Text(
                          "Your wishlist is empty",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyText16.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: wishlistProducts.length,
                  itemBuilder: (context, index) {
                    final product = wishlistProducts[index];

                    return CartItem(
                      product: product,
                      color: AppColors.black,
                      isCart: false,
                      quantity: 1,
                    );
                  },
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
