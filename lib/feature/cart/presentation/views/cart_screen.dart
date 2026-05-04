import 'package:flutter/material.dart';
import 'package:fresco/feature/cart/presentation/widgets/appbar_cart.dart';
import 'package:fresco/feature/cart/presentation/widgets/cart_screen_body.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CartAppbar(title: 'Cart'),
      body: CartScreenBody(),
      bottomNavigationBar: CheckoutSection(
        isIconFirst: false,
        price: "EGP 3,500",
        text: "Check Out",
        icon: Icons.arrow_forward,
      ),
    );
  }
}
