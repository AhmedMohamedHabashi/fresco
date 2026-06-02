import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/search/presentation/widgets/trending_searches.dart';
import 'package:lottie/lottie.dart';

class SearchInitialWidget extends StatelessWidget {
  const SearchInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TrendingSearches(),

        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180.w,
                  height: 180.w,
                  child: Lottie.asset('assets/lottie/search.json'),
                ),
                Text(
                  "Search for products",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Find your favorite items instantly",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
