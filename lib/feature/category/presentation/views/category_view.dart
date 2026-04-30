import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/shared/custom_app_bar.dart';
import 'package:fresco/feature/category/presentation/widgets/dashboard_categories.dart';
import 'package:fresco/feature/category/presentation/widgets/section_header.dart';
import 'package:fresco/core/shared/custom_navigation_bar.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8).r,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: DashboardCategories(
                      selectedIndex: selectedIndex,
                      onSelect: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SectionHeader(selectedIndex: selectedIndex),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
