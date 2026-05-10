import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class OrderSummarySection extends StatelessWidget {
  final String price;

  const OrderSummarySection({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    double subtotal =
        double.tryParse(price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
    double shipping = 50.0;
    double tax = 20.0;
    double total = subtotal + shipping + tax;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: AppTextStyle.bodyText18.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 12.h),
        _buildBillDetail("Subtotal", "EGP ${subtotal.toStringAsFixed(2)}"),
        _buildBillDetail("Shipping Fee", "EGP ${shipping.toStringAsFixed(2)}"),
        _buildBillDetail("Tax Fee", "EGP ${tax.toStringAsFixed(2)}"),
        const Divider(),
        _buildBillDetail(
          "Total Order",
          "EGP ${total.toStringAsFixed(2)}",
          isTotal: true,
        ),
      ],
    );
  }

  Widget _buildBillDetail(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: isTotal ? 18.sp : 14.sp,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? AppColors.primaryColor : AppColors.black,
              ),
            ),
          ),
          SizedBox(
            width: 120.w,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: isTotal ? 18.sp : 14.sp,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? AppColors.primaryColor : AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
