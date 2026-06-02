import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:fresco/feature/product_details/presentation/widgets/all_section_details.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/appbar_details.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsViewBody extends StatefulWidget {
  final Product product;

  const ProductDetailsViewBody({super.key, required this.product});

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late String selectedSize;
  late Color selectedColor;
  int quantity = 1;

  @override
  // void initState() {
  //   super.initState();
  //   selectedSize = "42";
  //   selectedColor = Colors.black;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarDetails(),
      bottomNavigationBar: CheckoutSection(
        price: (widget.product.price * quantity).toStringAsFixed(2),
        text: "Add to cart",
        isIconFirst: true,
        icon: Icons.add_shopping_cart_outlined,

        onTap: () {
          for (int i = 0; i < quantity; i++) {
            context.read<CartCubit>().addToCart(widget.product);
          }

          context.push(AppRoutes.cartView);
        },
      ),
      body: SingleChildScrollView(
        child: AllSectionDetails(
          product: widget.product,
          // selectedSize: selectedSize,
          // selectedColor: selectedColor,
          // onSizeChanged: (size) {
          //   setState(() => selectedSize = size);
          // },
          // onColorChanged: (color) {
          //   setState(() => selectedColor = color);
          // },
        ),
      ),
    );
  }
}
