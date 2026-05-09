import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Custom_AppBar.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:go_router/go_router.dart';
import '../widgets/order_product_card.dart';
import '../widgets/order_summary_section.dart';
import '../widgets/order_info_card.dart';
import '../widgets/confirm_order_button.dart';

class OrderReviewScreen extends StatelessWidget {
  final ListModel product;

  const OrderReviewScreen({super.key, required this.product});

  double calculateFinalTotal(String price) {
    double subtotal =
        double.tryParse(price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    return subtotal + 50.0 + 20.0;
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateFinalTotal(product.price);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBarView(title: "Order Review"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            OrderProductCard(product: product),
            SizedBox(height: 30.h),

            OrderSummarySection(price: product.price),
            SizedBox(height: 30.h),

            OrderInfoCard(
              sectionTitle: "Payment Method",
              icon: Icons.credit_card,
              title: "Master Card",
              subtitle: "**** **** **** 1234",
            ),
            SizedBox(height: 20.h),

            OrderInfoCard(
              sectionTitle: "Shipping Address",
              icon: Icons.location_on_outlined,
              title: "Osama Mohamed",
              subtitle: "Cairo, Egypt | +20 121 238 1254",
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConfirmOrderButton(
        price: "EGP ${totalAmount.toStringAsFixed(2)}",
        onPressed: () {
          context.push(AppRoutes.PaymentScreen);
        },
      ),
    );
  }
}
