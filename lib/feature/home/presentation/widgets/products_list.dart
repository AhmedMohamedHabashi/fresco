import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/feature/home/presentation/widgets/product_item.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:go_router/go_router.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  final Set<int> favorites;
  final Function(int productId) onTapFavorite;

  const ProductsList({
    super.key,
    required this.products,
    required this.favorites,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(child: Text("No products found"));
    }

    return Padding(
      padding: EdgeInsets.all(10.w),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.73,
        ),
        itemBuilder: (context, index) {
          final item = products[index];

          final isFav = favorites.contains(item.id);

          return ProductItem(
            product: item,
            isFavorite: isFav,
            onTapFavorite: () => onTapFavorite(item.id),
            onTap: () {
              context.push(AppRoutes.productDetailsView, extra: item);
            },
          );
        },
      ),
    );
  }
}
