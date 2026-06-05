import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/helpers/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/category/presentation/widgets/header_search.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      backgroundColor: AppColors.white,
      elevation: 0,
      leadingWidth: 50.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0.w, top: 8.0.h),
        child: Image.asset(AssetsHelper.logo, fit: BoxFit.cover),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 8.0.h),
        child: HeaderSearch(),
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.push(AppRoutes.cartView);
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.primaryColor,
            size: 30.sp,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}
