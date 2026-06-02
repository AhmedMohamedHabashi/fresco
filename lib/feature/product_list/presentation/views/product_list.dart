import 'package:flutter/material.dart';
import 'package:fresco/core/shared/custom_app_bar.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/product_list/presentation/widgets/product_list_body.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: const ProductListBody(),
    );
  }
}
