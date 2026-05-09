import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/product_details/presentation/widgets/color_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/description_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/name_price_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/product_rating_and_counter_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/photo_section.dart';
import 'package:fresco/feature/product_details/presentation/widgets/size_section.dart';

class AllSectionDetails extends StatefulWidget {
  final ListModel product;

  const AllSectionDetails({super.key, required this.product});

  @override
  State<AllSectionDetails> createState() => _AllSectionDetailsState();
}

class _AllSectionDetailsState extends State<AllSectionDetails> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhotoSection(
            product: widget.product,
            isFavorite: isFavorite,
            onTapFavorite: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),

          SizedBox(height: 20.h),

          NamePriceSection(product: widget.product),

          SizedBox(height: 10.h),

          ProductRatingAndCounterSection(product: widget.product),

          SizedBox(height: 10.h),

          DescriptionSection(product: widget.product),

          SizedBox(height: 19.h),

          SizeSection(sizes: widget.product.sizes),
          SizedBox(height: 10.h),

          ColorSection(colors: widget.product.colors),
        ],
      ),
    );
  }
}
