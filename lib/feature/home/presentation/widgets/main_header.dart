import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/helpers/greeting_helper.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/account/presentation/cubit/account_cubit.dart';
import 'package:fresco/feature/account/presentation/cubit/account_state.dart';
import 'package:fresco/feature/cart/data/cart_item.dart';
import 'package:fresco/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:go_router/go_router.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(GreetingHelper.getGreeting(), style: AppTextStyle.bodyText16),
            SizedBox(height: 5.h),
            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                if (state is AccountLoaded) {
                  return Text(
                    state.user.name,
                    style: AppTextStyle.bodyText18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }

                return Text(
                  FirebaseAuth.instance.currentUser?.displayName ??
                      'Loading...',
                );
              },
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            BlocBuilder<CartCubit, List<CartItemModel>>(
              builder: (context, cartItems) {
                return IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30.sp,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    context.push(AppRoutes.cartView);
                  },
                );
              },
            ),
            BlocBuilder<CartCubit, List<CartItemModel>>(
              builder: (context, cartItems) {
                final count = cartItems.length;
                if (count == 0) return const SizedBox();
                return Positioned(
                  right: -1.w,
                  top: -1.h,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14.w,
                      minHeight: 14.h,
                    ),
                    child: Center(
                      child: Text(
                        '$count',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
