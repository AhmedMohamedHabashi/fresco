import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/cart/data/cart_item.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Custom_AppBar.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/order_review_body.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/confirm_order_button.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  double calculateSubtotal(List<CartItemModel> items) {
    return items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartItemModel>>(
      builder: (context, items) {
        if (items.isEmpty) {
          return const Scaffold(body: Center(child: Text("Cart is empty")));
        }

        const double shipping = 50;
        const double tax = 20;

        final subtotal = calculateSubtotal(items);
        final totalAmount = subtotal + shipping + tax;

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: const CustomAppBarView(title: "Order Review"),

          body: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: OrderReviewBody(products: items, totalPrice: totalAmount),
          ),

          bottomNavigationBar: ConfirmOrderButton(
            price: "USD ${totalAmount.toStringAsFixed(2)}",
            onPressed: () {
              context.push(AppRoutes.paymentScreen);
            },
          ),
        );
      },
    );
  }
}
