import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/home/data/model/category_model.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Column(
        children: [
          CircleAvatar(
            radius: 26.r,
            backgroundColor: AppColors.white,
            child: IconButton(
              onPressed: () {
                StatefulNavigationShell.of(context).goBranch(1);
              },
              icon: Image.asset(
                category.image,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(height: 5.h),

          Text(
            category.title,
            style: AppTextStyle.bodyText14.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
