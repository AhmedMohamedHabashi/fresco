import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarView extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBarView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: AppColors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        onPressed: () => context.pop(),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
