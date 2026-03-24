import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/home/presentation/widgets/home_header.dart';
import 'package:fresco/feature/home/presentation/widgets/home_list_image.dart';
import 'package:fresco/feature/home/presentation/widgets/navigation_bar.dart';
import 'package:fresco/feature/home/presentation/widgets/products_list.dart';
import 'package:fresco/feature/home/presentation/widgets/section_title.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            HomeListImage(),
            SectionTitle(title: 'Popular Products'),
            ProductsList(
              isFavorite: isFavorite,
              onTapFavorite: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
