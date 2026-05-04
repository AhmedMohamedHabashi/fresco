import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: AppColors.white,
      elevation: 0,
      leadingWidth: 65.w,
      leading: Image.asset(AssetsHelper.logo, fit: BoxFit.cover),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
