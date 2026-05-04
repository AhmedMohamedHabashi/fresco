import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/home/presentation/widgets/home_header.dart';
import 'package:fresco/feature/home/presentation/widgets/home_list_image.dart';
import 'package:fresco/feature/home/presentation/widgets/products_list.dart';
import 'package:fresco/feature/home/presentation/widgets/section_title.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            const HomeListImage(),
            const SectionTitle(title: 'Popular Products'),
            ProductsList(
              isFavorite: isFavorite,
              onTapFavorite: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
