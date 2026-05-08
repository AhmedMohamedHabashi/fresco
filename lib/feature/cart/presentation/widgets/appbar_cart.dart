import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:go_router/go_router.dart';

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CartAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back, color: AppColors.mainColor, size: 27.sp),
      ),

      title: Center(
        child: Text(
          title,
          style: AppTextStyle.bodyText22.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: AppColors.mainColor, size: 30.sp),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
