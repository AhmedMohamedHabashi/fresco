import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Order_Info_Card.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Order_Product_Card.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/Order_Summary_Section.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class OrderReviewBody extends StatelessWidget {
  const OrderReviewBody({super.key, required this.product});

  final ListModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          title: "Test User",
          subtitle: "Alexandria, Egypt | +20 121 238 1254",
        ),
      ],
    );
  }
}
