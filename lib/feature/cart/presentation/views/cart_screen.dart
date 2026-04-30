import 'package:flutter/material.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/feature/cart/presentation/widgets/appbar_cart.dart';
import 'package:fresco/feature/cart/presentation/widgets/checkout_section.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName =
      'cart_screen'; // static ==> عgiشان انادي عليها باسم الكلاس
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CartAppbar(title: 'Cart'),
      ///////////////////////////////////////////////// list View /////////////////////////////////
      body: Column(
        children: [
          // لست المنتجات
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return CartItem(
                  title: 'Nike Air Jordan',
                  image: AssetsHelper.productImg3,
                  color: 'Orange',
                  price: 'EGP 3500',
                  size: '40',
                  isCart: true,
                  quantity: 0,
                  oldPrice: '3600',
                );
              },
            ),
          ),
          const CheckoutSection(),
        ],
        ///////////////////////finsh product list/////////////////////
      ),
    );
  }
}
