import 'package:flutter/material.dart';
import 'package:fresco/feature/auth/presentation/splash/widgets/splash_animation_logo.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashAnimationLogo());
  }
}
