import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/search/data/trending_searches.dart';
import 'package:fresco/feature/search/presentation/cubit/search_cubit.dart';

class TrendingSearches extends StatelessWidget {
  const TrendingSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        itemCount: trendingSearches.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final item = trendingSearches[index];

          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 250 + (index * 60)),
            tween: Tween(begin: 0, end: 1),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(20 * (1 - value), 0),
                child: Opacity(opacity: value, child: child),
              );
            },
            child: _ChipItem(item: item),
          );
        },
      ),
    );
  }
}

class _ChipItem extends StatefulWidget {
  final String item;

  const _ChipItem({required this.item});

  @override
  State<_ChipItem> createState() => _ChipItemState();
}

class _ChipItemState extends State<_ChipItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: pressed ? 0.96 : 1,
      duration: const Duration(milliseconds: 120),
      child: GestureDetector(
        onTapDown: (_) => setState(() => pressed = true),
        onTapUp: (_) => setState(() => pressed = false),
        onTapCancel: () => setState(() => pressed = false),
        onTap: () {
          context.read<SearchCubit>().onSearchChanged(widget.item);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),

            color: AppColors.primaryColor.withOpacity(0.08),

            border: Border.all(color: AppColors.primaryColor.withOpacity(0.15)),

            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            widget.item,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
