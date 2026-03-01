import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/presentation/widgets/login_header.dart';
import 'package:fresco/feature/auth/presentation/widgets/welcome_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(children: [LoginHeader(), const WelcomeWidget()]),
    );
  }
}
