import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/helpers/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool added = false;

  String getShortText(String text) {
    final words = text.split(' ');
    if (words.length <= 2) return text;
    return '${words[0]} ${words[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Text(
            widget.product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.bodyText14.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            children: [
              Text(
                getShortText(widget.product.subtitle),
                style: AppTextStyle.bodyText12.copyWith(
                  color: AppColors.mediumGrey,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primaryColor,
                size: 12.sp,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                widget.product.price.toString(),
                style: AppTextStyle.bodyText14.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            children: [
              Text(
                widget.product.rating.toString(),
                style: AppTextStyle.bodyText12.copyWith(color: AppColors.black),
              ),
              Icon(Icons.star, color: AppColors.yellow, size: 12.sp),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  context.read<CartCubit>().addToCart(widget.product);

                  setState(() {
                    added = true;
                  });

                  Future.delayed(const Duration(seconds: 1), () {
                    if (mounted) {
                      setState(() {
                        added = false;
                      });
                    }
                  });
                },

                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: added
                      ? Icon(
                          Icons.check_circle,
                          key: const ValueKey('check'),
                          color: AppColors.green,
                          size: 32.sp,
                        )
                      : Image.asset(
                          AssetsHelper.addToCart,
                          key: const ValueKey('add'),
                          height: 32.h,
                          width: 32.w,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
