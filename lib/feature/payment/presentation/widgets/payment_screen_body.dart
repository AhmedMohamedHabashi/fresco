import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:go_router/go_router.dart';

class PaymentScreenBody extends StatelessWidget {
  const PaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, size: 150.sp, color: AppColors.primaryColor),
          SizedBox(height: 30.h),
          Text(
            "Payment Success!",
            style: AppTextStyle.bodyText22.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ), // TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Your item will be shipped soon!",
            textAlign: TextAlign.center,
            style: AppTextStyle.bodyText16.copyWith(
              color: AppColors.mediumGrey,
            ),
          ),
          SizedBox(height: 50.h),
          CustomButton(
            buttonText: "Continue Shopping",
            onTap: () {
              context.go(AppRoutes.homeView);
            },
            color: AppColors.primaryColor,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
