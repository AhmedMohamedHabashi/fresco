import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/presentation/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LoginViewBody(),
    );
  }
}
