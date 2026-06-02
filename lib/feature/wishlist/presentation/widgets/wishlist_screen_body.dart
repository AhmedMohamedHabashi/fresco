import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/shimmer/product_image_shimmer.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_cubit.dart';
import 'package:fresco/feature/product_list/presentation/cubit/product_state.dart';
import 'package:fresco/feature/home/presentation/cubit/favorites_cubit.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class WishlistScreenBody extends StatelessWidget {
  const WishlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Text(
                      "Start adding your favorite products",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bodyText18.copyWith(
                        color: AppColors.primaryColor,
                      ),
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
