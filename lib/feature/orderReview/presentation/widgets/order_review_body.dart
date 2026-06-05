import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/cart/data/cart_item.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Order_Info_Card.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Order_Product_Card.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Order_Summary_Section.dart';

class OrderReviewBody extends StatelessWidget {
  final List<CartItemModel> products;
  final double totalPrice;

  const OrderReviewBody({
    super.key,
    required this.products,
    required this.totalPrice,
  });

  double get subtotal =>
      products.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...products.map(
          (item) => Column(
            children: [
              OrderProductCard(product: item.product),
              SizedBox(height: 20.h),
            ],
          ),
        ),

        SizedBox(height: 10.h),

        OrderSummarySection(subtotal: subtotal, shipping: 50, tax: 20),

        SizedBox(height: 10.h),

        OrderInfoCard(
          sectionTitle: "Payment Method",
          icon: Icons.credit_card,
          title: "Master Card",
          subtitle: "**** **** **** 1234",
          isPayment: true,
        ),

        SizedBox(height: 20.h),

        OrderInfoCard(
          sectionTitle: "Shipping Address",
          icon: Icons.location_on_outlined,
          title: "Test User",
          subtitle: "Alexandria, Egypt | +20 123 456 7890",
          isPayment: false,
        ),
      ],
    );
  }
}
