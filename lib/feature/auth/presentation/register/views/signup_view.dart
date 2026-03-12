import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/presentation/register/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SignUpViewBody(),
    );
  }
}
