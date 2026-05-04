import 'package:flutter/material.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class WishlistScreenBody extends StatelessWidget {
  const WishlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
