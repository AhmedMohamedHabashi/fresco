import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class SizeSection extends StatefulWidget {
  final List<String>? sizes;

  final Function(String selectedSize) onSizeSelected;

  const SizeSection({super.key, this.sizes, required this.onSizeSelected});

  @override
  State<SizeSection> createState() => _SizeSectionState();
}

class _SizeSectionState extends State<SizeSection> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.sizes != null && widget.sizes!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onSizeSelected(widget.sizes![0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizes = widget.sizes;

    if (sizes == null || sizes.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: AppTextStyle.bodyText18.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              sizes.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  widget.onSizeSelected(sizes[index]);
                },
                child: _SizeItem(
                  text: sizes[index],
                  selected: selectedIndex == index,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  final String text;
  final bool selected;

  const _SizeItem({required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: CircleAvatar(
          radius: 18.r,
          backgroundColor: AppColors.mainColor,
          child: Text(
            text,
            style: AppTextStyle.bodyText14.copyWith(color: Colors.white),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        padding: EdgeInsets.all(8.r),
        child: Text(
          text,
          style: AppTextStyle.bodyText14.copyWith(color: AppColors.textColor),
        ),
      ),
    );
  }
}
