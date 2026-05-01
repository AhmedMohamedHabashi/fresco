import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:go_router/go_router.dart';

class CreateAccountLine extends StatelessWidget {
  const CreateAccountLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            minimumSize: Size(50.w, 30.h),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            context.push(AppRoutes.signUpView);
          },
          child: Text(
            'Create Account',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 1.h,
              decorationColor: AppColors.white,
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
