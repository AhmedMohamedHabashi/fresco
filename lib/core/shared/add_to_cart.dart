import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ElevatedButton(
        onPressed: () {
          context.read<CartCubit>().addToCart(product);

          print("Cart updated");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text("Add to Cart", style: AppTextStyle.bodyText12),
        ),
      ),
    );
  }
}
