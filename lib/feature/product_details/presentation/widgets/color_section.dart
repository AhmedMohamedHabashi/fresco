import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class ColorSection extends StatefulWidget {
  final List<Color>? colors;
  final Function(Color selectedColor) onColorSelected;

  const ColorSection({super.key, this.colors, required this.onColorSelected});

  @override
  State<ColorSection> createState() => _ColorSectionState();
}

class _ColorSectionState extends State<ColorSection> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    if (widget.colors != null && widget.colors!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onColorSelected(widget.colors![0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.colors;

    if (colors == null || colors.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: AppTextStyle.bodyText18.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),

        Wrap(
          children: List.generate(
            colors.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onColorSelected(colors[index]);
              },
              child: _ColorCircle(
                color: colors[index],
                selected: selectedIndex == index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final bool selected;

  const _ColorCircle({required this.color, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.w,
        bottom: 10.h,
      ), // ضفت margin بسيط تحت كمان
      width: 30.w,
      height: 30.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.mainColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: selected
          ? const Icon(Icons.check, color: Colors.white, size: 20)
          : null,
    );
  }
}
