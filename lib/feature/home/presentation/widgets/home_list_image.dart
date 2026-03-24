import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class HomeListImage extends StatefulWidget {
  const HomeListImage({super.key});

  @override
  State<HomeListImage> createState() => _HomeListImageState();
}

class _HomeListImageState extends State<HomeListImage> {
  int currentIndex = 0;
  final PageController controller = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < AssetsHelper.imagesList.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      controller.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
          child: Listener(
            onPointerDown: (_) => timer?.cancel(),
            onPointerCancel: (_) => startTimer(),
            onPointerUp: (_) => startTimer(),
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: List.generate(
                AssetsHelper.imagesList.length,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 26.h),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        AssetsHelper.imagesList[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            AssetsHelper.imagesList.length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: currentIndex == index ? 20.w : 8.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColors.primaryColor
                    : AppColors.mediumGrey,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
