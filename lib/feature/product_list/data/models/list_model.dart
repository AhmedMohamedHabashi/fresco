import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class ListModel {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  final List<String> sizes;
  final List<Color> colors;

  const ListModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.sizes,
    required this.colors,
  });

  static final List<ListModel> listphoto = [
    ListModel(
      image: 'assets/images/cart_home_3.jpg',
      title: 'Nike Air Jordon ',
      subtitle: "Nike shoes flexible ",
      price: 'EGP 1,200 ',
      rating: 'Review (4.6)',
      sizes: ["38", "39", "40", "41", "42"],
      colors: [
        AppColors.black,
        AppColors.red,
        AppColors.green,
        AppColors.CoralRed,
      ],
    ),

    ListModel(
      image: 'assets/images/cart_home_4.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,100 ',
      rating: 'Review (4.5)',
      sizes: ["38", "39", "40"],
      colors: [AppColors.black, AppColors.green, AppColors.lightBlue],
    ),

    ListModel(
      image: 'assets/images/cart_home_5.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,000 ',
      rating: 'Review (4.8)',
      sizes: ["38", "39", "40", "41", "42", "43"],
      colors: [
        AppColors.black,
        AppColors.red,
        AppColors.green,
        AppColors.CoralRed,
        AppColors.lightBlue,
      ],
    ),

    ListModel(
      image: 'assets/images/cart_home_9.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,500',
      rating: 'Review (4.7)',
      sizes: ["38", "39"],
      colors: [AppColors.black, AppColors.red],
    ),

    ListModel(
      image: 'assets/images/cart_home_6.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible',
      price: 'EGP 1,800 ',
      rating: 'Review (4.3)',
      sizes: ["38", "39", "40"],
      colors: [
        AppColors.black,
        AppColors.red,
        AppColors.green,
        AppColors.CoralRed,
      ],
    ),

    ListModel(
      image: 'assets/images/cart_home_1.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible',
      price: 'EGP 1,900',
      rating: 'Review (4.9)',
      sizes: ["38", "39", "40", "41", "42", "43"],
      colors: [
        AppColors.black,
        AppColors.red,
        AppColors.green,
        AppColors.CoralRed,
        AppColors.lightBlue,
      ],
    ),
    ListModel(
      image: 'assets/images/cart_home_10.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible',
      price: 'EGP 1,700',
      rating: 'Review (4.5)',
      sizes: ["38", "39", "40", "41", "42", "43"],
      colors: [
        AppColors.black,
        AppColors.red,
        AppColors.green,
        AppColors.CoralRed,
        AppColors.lightBlue,
      ],
    ),
    ListModel(
      image: 'assets/images/cart_home_11.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible',
      price: 'EGP 1,200',
      rating: 'Review (4.4)',
      sizes: ["38", "39", "40", "41", "42", "43"],
      colors: [AppColors.black, AppColors.red, AppColors.lightBlue],
    ),
  ];
}
