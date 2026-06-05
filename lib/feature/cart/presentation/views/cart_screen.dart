import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/helpers/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/cart/data/cart_item.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/cart/presentation/widgets/appbar_cart.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart' as lottie;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CartAppbar(title: 'Cart'),

      body: BlocBuilder<CartCubit, List<CartItemModel>>(
        builder: (context, items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  lottie.Lottie.asset(AssetsHelper.emptyCart, repeat: true),
                  SizedBox(height: 10.h),
                  Text(
                    "Your cart is empty",
                    style: AppTextStyle.bodyText16.copyWith(
                      color: AppColors.primaryColor.withOpacity(0.5),
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
      ),

      bottomNavigationBar: BlocBuilder<CartCubit, List<CartItemModel>>(
        builder: (context, items) {
          double totalPrice = 0;

          for (var item in items) {
            totalPrice += item.product.price * item.quantity;
          }

          return CheckoutSection(
            price: totalPrice.toStringAsFixed(2),
            isIconFirst: false,
            text: "Check Out",
            icon: Icons.arrow_forward,
            onTap: () {
              context.push(AppRoutes.orderReviewView);
            },
          );
        },
      ),
    );
  }
}
