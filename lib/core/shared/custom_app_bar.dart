import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/category/presentation/widgets/header_search.dart';

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
        padding: EdgeInsets.only(left: 8.0, top: 8.0).r,
        child: Image.asset(AssetsHelper.logo, fit: BoxFit.cover),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 8.0).r,
        child: HeaderSearch(),
      ),
      actions: [
        IconButton(
          onPressed: () {},
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
