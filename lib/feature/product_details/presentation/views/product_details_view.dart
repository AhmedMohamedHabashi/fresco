import 'package:flutter/material.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:fresco/feature/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsViewBody(product: product));
  }
}
