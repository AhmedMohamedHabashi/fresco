import 'package:flutter/material.dart';
import 'package:fresco/core/shared/custom_app_bar.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/wishlist_screen_body.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = 'WishlistScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: const WishlistScreenBody(),
    );
  }
}
