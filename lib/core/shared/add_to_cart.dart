import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:go_router/go_router.dart';

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

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            builder: (_) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 16.h,
                    bottom: 30.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: AppColors.green,
                        size: 50.sp,
                      ),
                      SizedBox(height: 10.h),

                      Text(
                        "Added to cart successfully",
                        style: AppTextStyle.bodyText14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),

                      SizedBox(height: 15.h),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.pop();
                                context.go(AppRoutes.homeView);
                              },
                              child: Text(
                                "Continue Shopping",
                                style: AppTextStyle.bodyText12.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 10.w),

                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context.pop();
                                context.push(AppRoutes.cartView);
                              },
                              child: Text(
                                "View Cart",
                                style: AppTextStyle.bodyText12.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
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
