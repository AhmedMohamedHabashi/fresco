import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/search/presentation/widgets/trending_searches.dart';
import 'package:fresco/core/utils/helpers/assets_helper/assets_helper.dart';
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
                  child: Lottie.asset(AssetsHelper.emptySearch, repeat: true),
                ),
                Text(
                  "Search for products",
                  style: AppTextStyle.bodyText20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Find your favorite items instantly",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyText14.copyWith(
                    color: AppColors.primaryColor.withOpacity(0.5),
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
