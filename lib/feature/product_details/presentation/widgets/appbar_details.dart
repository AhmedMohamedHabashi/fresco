import 'package:flutter/material.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:go_router/go_router.dart';

class AppBarDetails extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () {
            context.pop();
          },
        ),

        title: Text(
          "Product Details",
          style: AppTextStyle.bodyText18.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.searchView);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              context.push(AppRoutes.cartView);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
