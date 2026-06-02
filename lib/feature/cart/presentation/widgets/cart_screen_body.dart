import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/cart/data/cart_item.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItemModel>>(
      builder: (context, items) {
        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.remove_shopping_cart_outlined,
                  size: 70.sp,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Your cart is empty",
                  style: AppTextStyle.bodyText16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return CartItem(
              product: item.product,
              quantity: item.quantity,
              isCart: true,
              color: AppColors.primaryColor,
            );
          },
        );
      },
    );
  }
}
