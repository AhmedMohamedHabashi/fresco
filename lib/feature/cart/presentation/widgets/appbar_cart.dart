import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CartAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.mainColor,
          size: 27,
        ),
      ),

      title: Center(
        child: Text(
          title,
          style: TextStyle(color: AppColors.mainColor, fontSize: 22),
        ),
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: AppColors.mainColor, size: 30),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.mainColor,
            size: 27,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
