import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/assets_helper/assets_helper.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 73, 133),
      body: Center(
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(AssetsHelper.splash),
          height: 180.h,
          width: 190.w,
        ),
      ),
    );
  }
}
