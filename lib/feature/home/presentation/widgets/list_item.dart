import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/home/presentation/widgets/category_item.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const CategoryItem();
          // هنا بعرض العناصر اللي بتتكرر في القائمة، ممكن تغيرها حسب الحاجة بتاعت ال List view
        },
      ),
    );
  }
}
