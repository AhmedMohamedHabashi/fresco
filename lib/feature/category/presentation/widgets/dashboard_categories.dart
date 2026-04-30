import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/listes_helper/listes_helper.dart';
import 'package:fresco/feature/category/presentation/widgets/category_layout.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final void Function(int)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
      child: ListView.builder(
        itemCount: ListesHelper.categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return CategoryLayout(
            index: index,
            title: ListesHelper.categories[index],
            isSelected: isSelected,
            onSelect: onSelect,
          );
        },
      ),
    );
  }
}
