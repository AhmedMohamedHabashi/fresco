import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class OrderSummarySection extends StatelessWidget {
  final String price;

  const OrderSummarySection({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Summary",
          style: AppTextStyle.bodyText18.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        SizedBox(height: 12.h),
        _buildBillDetail("Subtotal", price),
        _buildBillDetail("Shipping Fee", "EGP 50.0"),
        _buildBillDetail("Tax Fee", "EGP 20.0"),
        const Divider(),
        _buildBillDetail("Total Order", price, isTotal: true),
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
              ),
            ),
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: isTotal ? 18.sp : 14.sp,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isTotal ? AppColors.primaryColor : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
