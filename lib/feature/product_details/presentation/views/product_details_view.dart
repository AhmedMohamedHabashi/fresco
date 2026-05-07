import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/all_section_details.dart';
import 'package:fresco/feature/product_details/presentation/widgets/appbar_details.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart'; // 👈 (1) import

class ProductDetailsView extends StatefulWidget {
  final ListModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarDetails(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllSectionDetails(product: product),
            CheckoutSection(
              price: product.price,
              text: "Add to cart",
              isIconFirst: true,
              icon: Icons.add_shopping_cart_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
