import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:go_router/go_router.dart';

class CheckoutSection extends StatelessWidget {
  final String text;
  final String price;
  final bool isIconFirst;
  final IconData icon;
  final ListModel product;

  const CheckoutSection({
    super.key,
    required this.text,
    required this.price,
    required this.isIconFirst,
    required this.icon,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total price:",
                style: AppTextStyle.bodyText16.copyWith(
                  color: AppColors.mainColor.withOpacity(0.75),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                price,
                style: AppTextStyle.bodyText20.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(width: 30.w),

          Expanded(
            child: GestureDetector(
              onTap: () {
                context.push(AppRoutes.cartView, extra: product);
              },
              child: Container(
                height: 55.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: isIconFirst
                      ? [
                          Icon(icon, color: Colors.white),
                          SizedBox(width: 15.w),
                          Text(text, style: AppTextStyle.bodyText18),
                        ]
                      : [
                          Text(text, style: AppTextStyle.bodyText18),
                          SizedBox(width: 15.w),
                          Icon(icon, color: AppColors.white),
                        ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
