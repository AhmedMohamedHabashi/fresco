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
  late String selectedSize;
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.product.sizes.isNotEmpty
        ? widget.product.sizes[0]
        : "";
    selectedColor = widget.product.colors.isNotEmpty
        ? widget.product.colors[0]
        : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarDetails(),
      bottomNavigationBar: CheckoutSection(
        product: widget.product.copyWith(
          selectedSize: selectedSize,
          selectedColor: selectedColor,
        ),
        price: widget.product.price,
        text: "Add to cart",
        isIconFirst: true,
        icon: Icons.add_shopping_cart_outlined,
      ),
      body: SingleChildScrollView(
        child: AllSectionDetails(
          product: widget.product,
          selectedSize: selectedSize,
          selectedColor: selectedColor,
          onSizeChanged: (size) {
            setState(() {
              selectedSize = size;
            });
          },
          onColorChanged: (color) {
            setState(() {
              selectedColor = color;
            });
          },
        ),
      ),
    );
  }
}
