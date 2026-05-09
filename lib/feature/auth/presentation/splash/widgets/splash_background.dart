import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({
    super.key,
    required Animation<double> opacityAnimation,
    required Animation<Offset> floatingAnimation,
    required Animation<double> scaleAnimation,
  }) : _opacityAnimation = opacityAnimation,
       _floatingAnimation = floatingAnimation,
       _scaleAnimation = scaleAnimation;

  final Animation<double> _opacityAnimation;
  final Animation<Offset> _floatingAnimation;
  final Animation<double> _scaleAnimation;

  Widget _buildGlow({double? top, double? bottom}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: -80.w,
      right: -80.w,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
        child: Container(
          height: 480.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 1.1.r,
              colors: [AppColors.white.withOpacity(0.3), AppColors.transparent],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 11, 74, 133)),
      child: Stack(
        children: [
          _buildGlow(top: -200.h),
          _buildGlow(bottom: -200.h),

          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _floatingAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(AssetsHelper.splash, width: 160.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
