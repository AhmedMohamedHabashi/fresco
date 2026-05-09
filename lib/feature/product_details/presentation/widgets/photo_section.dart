import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/wishlist/data/wishlist_controller.dart';

class PhotoSection extends StatefulWidget {
  final ListModel product;
  final bool isFavorite;
  final VoidCallback? onTapFavorite;

  final String? selectedSize;
  final Color? selectedColor;

  const PhotoSection({
    super.key,
    required this.product,
    required this.isFavorite,
    this.onTapFavorite,
    this.selectedSize,
    this.selectedColor,
  });

  @override
  State<PhotoSection> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends State<PhotoSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250.h,
          decoration: BoxDecoration(
            color: AppColors.mediumGrey,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.08),
                blurRadius: 12.r,
                offset: Offset(0, 6.r),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  widget.product.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: () async {
                    // 🟢 الزتونة هنا: بنعمل نسخة جديدة فيها الاختيارات قبل ما نبعتها للـ Controller
                    final productToSave = widget.product.copyWith(
                      selectedSize: widget.selectedSize,
                      selectedColor: widget.selectedColor,
                    );

                    await WishlistController.toggle(productToSave);

                    if (widget.onTapFavorite != null) {
                      widget.onTapFavorite!();
                    }

                    setState(() {});
                  },
                  child: ValueListenableBuilder(
                    valueListenable: WishlistController.items,
                    builder: (context, items, _) {
                      final isFav = items.any((e) => e.id == widget.product.id);

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
