import 'package:flutter/material.dart';
import 'package:fresco/feature/product_details/presentation/widgets/product_details_view_body.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class ProductDetailsView extends StatelessWidget {
  final ListModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductDetailsViewBody(product: product));
  }
}
