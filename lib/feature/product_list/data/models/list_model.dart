import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class ListModel {
  final String id;
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String rating;
  final List<String> sizes;
  final List<Color> colors;

  // 🟢 الحقول الجديدة لتخزين اختيار المستخدم
  final String? selectedSize;
  final Color? selectedColor;

  const ListModel({
    this.id = '',
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.sizes,
    required this.colors,
    this.selectedSize, // اختياري في الليست العامة، وإجباري عند الإضافة للكارت
    this.selectedColor, // اختياري في الليست العامة، وإجباري عند الإضافة للكارت
  });

  // 🟢 دالة الـ copyWith (أهم دالة عشان تاخد نسخة من المنتج وتحط فيها الاختيارات)
  ListModel copyWith({String? selectedSize, Color? selectedColor}) {
    return ListModel(
      id: this.id,
      image: this.image,
      title: this.title,
      subtitle: this.subtitle,
      price: this.price,
      rating: this.rating,
      sizes: this.sizes,
      colors: this.colors,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  // 🟢 تحويل البيانات لـ JSON (عشان التخزين)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'rating': rating,
      'sizes': sizes,
      'colors': colors.map((e) => e.value).toList(),
      'selectedSize': selectedSize,
      'selectedColor': selectedColor?.value, // بنخزن قيمة اللون كـ int
    };
  }

  // 🟢 استقبال البيانات من JSON
  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      price: json['price'] ?? '',
      rating: json['rating'] ?? '',
      sizes: List<String>.from(json['sizes'] ?? []),
      colors: (json['colors'] as List<dynamic>).map((e) => Color(e)).toList(),
      selectedSize: json['selectedSize'],
      selectedColor: json['selectedColor'] != null
          ? Color(json['selectedColor'])
          : null,
    );
  }

  // الداتا الثابتة بتاعتك
  static final List<ListModel> listphoto = [
    ListModel(
      id: '1',
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
      id: '2',
      image: 'assets/images/cart_home_4.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,100 ',
      rating: 'Review (4.5)',
      sizes: ["38", "39", "40"],
      colors: [AppColors.black, AppColors.green, AppColors.lightBlue],
    ),
    ListModel(
      id: '3',
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
      id: '4',
      image: 'assets/images/cart_home_9.jpg',
      title: 'Nike Air Jordon',
      subtitle: 'Nike shoes flexible ',
      price: 'EGP 1,500',
      rating: 'Review (4.7)',
      sizes: ["38", "39"],
      colors: [AppColors.black, AppColors.red],
    ),
    ListModel(
      id: '5',
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
      id: '6',
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
      id: '7',
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
      id: '8',
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
