import 'package:flutter/material.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/feature/cart/presentation/widgets/appbar_cart.dart';
import 'package:fresco/feature/cart/presentation/widgets/cart_screen_body.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  final ListModel addedProduct;

  const CartScreen({super.key, required this.addedProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CartAppbar(title: 'Cart'),
      body: CartScreenBody(product: addedProduct),
      bottomNavigationBar: CheckoutSection(
        product: addedProduct,
        isIconFirst: false,
        price: addedProduct.price,
        text: "Check Out",
        icon: Icons.arrow_forward,
        onTap: () {
          context.push(AppRoutes.orderReviewView, extra: addedProduct);
        },
      ),
    );
  }
}
