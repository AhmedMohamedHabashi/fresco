import 'package:flutter/material.dart';
import 'package:fresco/core/app_responsive.dart';
import 'package:fresco/feature/cart/presentation/views/cart_screen.dart';
import 'package:fresco/feature/wishlist/presentation/views/wishlist_screen.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class FrescoApp extends StatelessWidget {
  const FrescoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Fresco App',
        home: CartScreen(),
      ),
    );
  }
}
