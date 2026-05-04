import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/home/presentation/widgets/product_details.dart';
import 'package:fresco/feature/home/presentation/widgets/product_item_img.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.isFavorite,
    this.onTapFavorite,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    this.onTap,
  });

  final bool isFavorite;
  final void Function()? onTapFavorite;
  final void Function()? onTap;

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(4.w),
          height: 210.h,
          decoration: BoxDecoration(
            color: AppColors.lightBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductItemImage(
                image: image,
                isFavorite: isFavorite,
                onTapFavorite: onTapFavorite,
              ),
              ProductDetails(
                title: title,
                subtitle: subtitle,
                price: price,
                rating: rating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
