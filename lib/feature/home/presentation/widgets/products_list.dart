import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/home/presentation/widgets/product_item.dart';
import 'package:fresco/feature/product_details/presentation/views/product_details_view.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.isFavorite, this.onTapFavorite});

  final bool isFavorite;
  final void Function()? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      itemCount: ListModel.listphoto.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 22.h,
        crossAxisSpacing: 22.w,
        childAspectRatio: 0.77,
      ),
      itemBuilder: (context, index) {
        final item = ListModel.listphoto[index];

        return ProductItem(
          isFavorite: isFavorite,
          onTapFavorite: onTapFavorite,
          image: item.image,
          title: item.title,
          subtitle: item.subtitle,
          price: item.price,
          rating: item.rating,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsView(product: item),
              ),
            );
          },
        );
      },
    );
  }
}
