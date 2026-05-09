import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'item_details.dart';
import 'item_actions.dart';

class CartItem extends StatelessWidget {
  final String title, image, size, price, oldPrice;
  final Color? color;
  final int quantity;
  final bool isCart;

  const CartItem({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
    required this.oldPrice,
    required this.isCart,
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
              width: 120.w,
              height: double.infinity,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  ItemDetails(
                    title: title,
                    isCart: isCart,
                    color: color,
                    size: size,
                  ),
                  const Spacer(),
                  ItemActions(price: price, oldPrice: oldPrice, isCart: isCart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
