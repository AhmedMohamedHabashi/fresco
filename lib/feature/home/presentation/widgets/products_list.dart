import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/home/presentation/widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.isFavorite, this.onTapFavorite});

  final bool isFavorite;
  final void Function()? onTapFavorite;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ), //  padding من كل الجهات
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //  عمودين
        mainAxisSpacing: 22, //  المسافة بين الصفوف
        crossAxisSpacing: 22, //  المسافة بين الأعمدة
        childAspectRatio: 0.75, //  نسبة الطول للعرض لكل عنصر
      ),
      itemCount: 6,
      itemBuilder: (context, index) =>
          ProductItem(isFavorite: isFavorite, onTapFavorite: onTapFavorite),
      // هنا بعرض العناصر اللي بتتكرر في القائمة، ممكن تغيرها حسب الحاجة بتاعت ال List view
    );
  }
}
