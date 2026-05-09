import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
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
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Your item will be shipped soon!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 50.h),
          CustomButton(
            buttonText: "Continue Shopping",
            onTap: () {
              context.go(AppRoutes.homeView);
            },
            color: AppColors.primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
