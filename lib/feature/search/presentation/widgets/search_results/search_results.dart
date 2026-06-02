import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/search/presentation/cubit/search_state.dart';
import 'widgets/search_result_item.dart';

class SearchResultsWidget extends StatelessWidget {
  final SearchLoaded state;

  const SearchResultsWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(12.w),
      itemCount: state.products.length,
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        return SearchResultItem(
          product: state.products[index],
          query: state.query,
        );
      },
    );
  }
}
