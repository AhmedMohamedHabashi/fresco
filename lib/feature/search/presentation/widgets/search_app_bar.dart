import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/custom_search.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/search/presentation/cubit/search_cubit.dart';
import 'package:go_router/go_router.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      titleSpacing: 5.w,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
          size: 27.sp,
        ),
        onPressed: () => context.pop(),
      ),
      title: CustomSearch(
        hintText: "Search products...",
        showShadow: false,
        showBorder: true,
        borderWidth: 1,
        onChanged: (value) {
          context.read<SearchCubit>().onSearchChanged(value);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
