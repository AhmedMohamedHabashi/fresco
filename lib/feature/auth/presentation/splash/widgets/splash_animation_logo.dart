import 'package:flutter/material.dart';
import 'package:fresco/feature/auth/presentation/splash/widgets/splash_background.dart';

class SplashAnimationLogo extends StatefulWidget {
  const SplashAnimationLogo({super.key});

  @override
  State<SplashAnimationLogo> createState() => _SplashAnimationLogoState();
}

class _SplashAnimationLogoState extends State<SplashAnimationLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> opacity;
  late final Animation<double> scale;
  late final Animation<Offset> floating;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    opacity = Tween(begin: 0.0, end: 1.0).animate(_controller);

    scale = Tween(begin: 0.8, end: 1.0).animate(_controller);

    floating = Tween(
      begin: const Offset(0, 0.02),
      end: const Offset(0, -0.02),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashBackground(
      opacityAnimation: opacity,
      scaleAnimation: scale,
      floatingAnimation: floating,
    );
  }
}
