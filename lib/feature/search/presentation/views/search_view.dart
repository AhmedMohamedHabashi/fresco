import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/custom_search.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: 27.sp,
          ),
          onPressed: () => context.pop(),
        ),
        title: CustomSearch(
          hintText: "Search here",
          showShadow: false,
          showBorder: true,
          borderWidth: 1.0,
        ),
      ),
    );
  }
}
