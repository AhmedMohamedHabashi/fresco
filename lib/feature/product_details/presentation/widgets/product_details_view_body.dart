import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/all_section_details.dart';
import 'package:fresco/feature/product_details/presentation/widgets/appbar_details.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final ListModel product;

  const ProductDetailsViewBody({super.key, required this.product});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarDetails(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllSectionDetails(product: widget.product),

            CheckoutSection(
              product: widget.product,
              price: widget.product.price,
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
