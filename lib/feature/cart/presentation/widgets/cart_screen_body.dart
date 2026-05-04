import 'package:flutter/material.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return CartItem(
                title: 'Nike Air Jordan',
                image: AssetsHelper.productImg3,
                color: 'Orange',
                price: 'EGP 3,500',
                size: '40',
                isCart: true,
                quantity: 0,
                oldPrice: '3,600',
              );
            },
          ),
        ),
        const CheckoutSection(),
      ],
    );
  }
}
