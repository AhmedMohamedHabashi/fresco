import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: CurvedNavigationBar(
          index: currentIndex,
          onTap: onTap,
          animationDuration: const Duration(milliseconds: 300),
          height: 65.h,
          backgroundColor: AppColors.white,
          color: AppColors.primaryColor,
          items: [
            CurvedNavigationBarItem(
              child: Icon(
                Icons.home_outlined,
                size: 27.sp,
                color: AppColors.white,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.grid_view_rounded,
                size: 27.sp,
                color: AppColors.white,
              ),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.favorite, size: 27.sp, color: AppColors.white),
            ),
            CurvedNavigationBarItem(
              child: Icon(
                Icons.person_outlined,
                size: 27.sp,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
