import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/listes_helper/listes_helper.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/home/presentation/widgets/home_list_image.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            ListesHelper.categories[selectedIndex],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.bodyText16.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          HomeListImage(heightBanar: 135.h),
        ],
      ),
    );
  }
}
