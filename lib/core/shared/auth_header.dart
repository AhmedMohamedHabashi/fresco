import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, this.height = 220});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Center(child: Image.asset(AssetsHelper.logo, height: 200.h)),
      ),
    );
  }
}
