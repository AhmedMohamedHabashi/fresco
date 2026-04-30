import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/shared/custom_app_bar.dart';
import 'package:fresco/core/shared/custom_navigation_bar.dart';
import 'package:fresco/core/utils/models/category_model.dart';
import 'package:fresco/feature/category/presentation/widgets/caregory_grid.dart';
import 'package:fresco/feature/category/presentation/widgets/dashboard_categories.dart';
import 'package:fresco/feature/category/presentation/widgets/section_header.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8).r,
              child: Row(
                children: [
                  DashboardCategories(
                    selectedIndex: selectedIndex,
                    onSelect: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Column(
                      children: [
                        SectionHeader(selectedIndex: selectedIndex),
                        SizedBox(height: 10.h),
                        Expanded(
                          child: CategoryGrid(
                            categories: selectedIndex == 0
                                ? CategoryModel.categoriesMan
                                : CategoryModel.categoriesWoman,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
