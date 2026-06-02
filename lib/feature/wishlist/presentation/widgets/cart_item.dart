import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/shimmer/product_image_shimmer.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

import 'item_details.dart';
import 'item_actions.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;
  final bool isCart;
  final Color? color;

  const CartItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.isCart,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.mainColor, width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: SizedBox(
              width: 100.w,
              height: double.infinity,
              child: Image.network(
                product.image.isNotEmpty
                    ? product.image
                    : "https://picsum.photos/200",

                fit: BoxFit.contain,

                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: ProductImageShimmer());
                },

                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.image),
                  );
                },
              ),
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetails(
                    title: product.title,
                    subtitle: product.subtitle,
                    isCart: isCart,
                    onDelete: () {
                      context.read<CartCubit>().removeFromCart(product);
                    },
                  ),

                  const Spacer(),

                  ItemActions(
                    price: product.price,
                    oldPrice: product.price * 1.2,
                    isCart: isCart,
                    product: product,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
