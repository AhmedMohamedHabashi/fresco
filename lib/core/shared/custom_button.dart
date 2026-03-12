import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.buttonText});
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              minimumSize: Size(double.infinity, 50.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              buttonText ?? 'Login',
              style: AppTextStyle.bodyText16.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
