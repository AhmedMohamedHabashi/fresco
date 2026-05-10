import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/wishlist/data/wishlist_controller.dart';
import 'package:fresco/feature/wishlist/presentation/widgets/cart_item.dart';

class WishlistScreenBody extends StatefulWidget {
  const WishlistScreenBody({super.key});

  @override
  State<WishlistScreenBody> createState() => _WishlistScreenBodyState();
}

class _WishlistScreenBodyState extends State<WishlistScreenBody> {
  @override
  void initState() {
    super.initState();
    // تحميل البيانات عند فتح الصفحة
    WishlistController.load();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ListModel>>(
      valueListenable: WishlistController.items,
      builder: (context, items, _) {
        if (items.isEmpty) {
          return Center(
            child: Text(
              "Start adding your favorite products",
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyText18.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final product = items[index];

            return CartItem(
              title: product.title,
              image: product.image,
              color:
                  product.selectedColor ??
                  (product.colors.isNotEmpty
                      ? product.colors.first
                      : AppColors.black),
              price: product.price,
              oldPrice: "EGP 1,500",
              isCart: false,
              size:
                  product.selectedSize ??
                  (product.sizes.isNotEmpty ? product.sizes.first : "42"),

              quantity: 1,
            );
          },
        );
      },
    );
  }
}
