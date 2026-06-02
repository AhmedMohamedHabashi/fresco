import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off,
            size: 80.sp,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          Text(
            "No results found",
            style: AppTextStyle.bodyText16.copyWith(
              color: AppColors.primaryColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
