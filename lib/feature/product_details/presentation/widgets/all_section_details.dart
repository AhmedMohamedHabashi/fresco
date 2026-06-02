import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

import 'name_price_section.dart';
import 'product_rating_and_counter_section.dart';
import 'description_section.dart';
import 'photo_section.dart';
// import 'size_section.dart';
// import 'color_section.dart';

class AllSectionDetails extends StatefulWidget {
  final Product product;

  // final Function(String size) onSizeChanged;
  // final Function(Color color) onColorChanged;

  // final String selectedSize;
  // final Color selectedColor;

  const AllSectionDetails({
    super.key,
    required this.product,
    // required this.onSizeChanged,
    // required this.onColorChanged,
    // required this.selectedSize,
    // required this.selectedColor,
  });

  @override
  State<AllSectionDetails> createState() => _AllSectionDetailsState();
}

class _AllSectionDetailsState extends State<AllSectionDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoSection(product: widget.product),
          SizedBox(height: 20.h),
          NamePriceSection(product: widget.product),
          SizedBox(height: 10.h),
          ProductRatingAndCounterSection(product: widget.product),
          SizedBox(height: 10.h),
          DescriptionSection(product: widget.product),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  //   List<String> _getSizes(Product product) {
  //     return ["38", "39", "40", "41"];
  //   }

  //   List<Color> _getColors(Product product) {
  //     return [Colors.black, Colors.blue, Colors.red];
  //   }
}
