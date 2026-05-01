import 'package:flutter/material.dart';
import 'package:fresco/core/shared/custom_app_bar.dart';
import 'package:fresco/core/shared/custom_navigation_bar.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routeName = 'WishlistScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const CartItem(
                  // تمرير البيانات للـ Widget
                  title: "Nike Air Jordan",
                  image: "assets/images/cart_home_3.jpg",
                  color: "Black color",
                  price: "EGP 1,200",
                  oldPrice: "EGP 1,500",
                  isCart: false, // هنا بنحدد إن ده شكل الويشليست
                  size: '44',
                  quantity: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
