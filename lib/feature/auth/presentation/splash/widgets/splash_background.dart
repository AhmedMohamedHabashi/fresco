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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 11, 74, 133)),
      child: Stack(
        children: [
          // Glow فوق
          Positioned(
            top: -180.h,
            left: -50.w,
            right: -50.w,
            child: Container(
              height: 370.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  radius: 0.7.r,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    AppColors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Glow تحت
          Positioned(
            bottom: -180.h,
            left: -50.w,
            right: -50.w,
            child: Container(
              height: 370.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  radius: 0.7.r,
                  colors: [
                    Colors.white.withOpacity(0.4),
                    AppColors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Logo Animation
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _floatingAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(AssetsHelper.splash, width: 180.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
