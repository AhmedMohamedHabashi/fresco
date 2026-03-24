import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/home/presentation/widgets/list_item.dart';
import 'package:fresco/feature/home/presentation/widgets/main_header.dart';
import 'package:fresco/feature/home/presentation/widgets/section_title.dart';
import 'package:fresco/feature/home/presentation/widgets/search_home.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //هنا انا عملت دي علشان اقدر احط السيرش بار فوق الكونتينر اللي في الجريدينت
      clipBehavior:
          Clip.none, // دي علشان السيرش بار يطلع من الكونتينر اللي في الجريدينت
      children: [
        Container(
          height: 280.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor.withOpacity(0.8),
                AppColors.primaryColor,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(170.r, 28.r),
              bottomRight: Radius.elliptical(170.r, 28.r),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h, right: 18.w, left: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainHeader(),
                    SizedBox(height: 20.h),
                    SectionTitle(
                      isHeader: true,
                      title: "Popular Categories",
                      verticalPadding: 0,
                      horizontalPadding: 0,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              ListItem(),
            ],
          ),
        ),

        Positioned(
          // دي علشان احط السيرش بار فوق الكونتينر اللي في الجريدينت
          bottom: -15.h,
          left: 35.w,
          right: 35.w,
          child: SearchHome(),
        ),
      ],
    );
  }
}
