import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class ProductRatingAndCounterSection extends StatefulWidget {
  final ListModel product;

  const ProductRatingAndCounterSection({super.key, required this.product});

  @override
  State<ProductRatingAndCounterSection> createState() =>
      _ProductRatingAndCounterSectionState();
}

class _ProductRatingAndCounterSectionState
    extends State<ProductRatingAndCounterSection> {
  int quantity = 1;

  void increase() {
    setState(() {
      quantity++;
    });
  }

  void decrease() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Sold container
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Text(
            "3.230 sold",
            style: AppTextStyle.bodyText14.copyWith(color: AppColors.mainColor),
          ),
        ),

        SizedBox(width: 10.w),

        /// Rating
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16.sp),
            SizedBox(width: 4.w),
            Text(
              widget.product.rating,
              style: AppTextStyle.bodyText14.copyWith(
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),

        const Spacer(),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: decrease,
                child: _circleIcon(Icons.remove),
              ),

              SizedBox(width: 12.w),

              Text(
                "$quantity",
                style: AppTextStyle.bodyText14.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(width: 12.w),

              GestureDetector(onTap: increase, child: _circleIcon(Icons.add)),
            ],
          ),
        ),
      ],
    );
  }

  /// Reusable icon widget
  Widget _circleIcon(IconData icon) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.w),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white, size: 18.sp),
      ),
    );
  }
}
