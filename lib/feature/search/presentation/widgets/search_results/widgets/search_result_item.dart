import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:fresco/config/routes/app_routes.dart';
import '../helpers/text_highlighter.dart';

class SearchResultItem extends StatelessWidget {
  final Product product;
  final String query;

  const SearchResultItem({
    super.key,
    required this.product,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: () {
        context.push(AppRoutes.productDetailsView, extra: product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.w),

          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              product.image,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),

          title: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextHighlighter.highlight(text: product.title, query: query),
          ),

          subtitle: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              "\$${product.price}",
              style: AppTextStyle.bodyText16.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
