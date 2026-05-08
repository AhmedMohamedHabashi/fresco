import 'package:flutter/material.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class CartScreenBody extends StatelessWidget {
  final ListModel product;
  const CartScreenBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return CartItem(
                title: product.title,
                image: product.image,
                color: 'Orange',
                size: '40',
                price: product.price,
                isCart: true,
                quantity: 1,
                oldPrice: '',
              );
            },
          ),
        ),
      ],
    );
  }
}
