import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/data/service/auth_service.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fresco/feature/auth/presentation/register/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => AuthCubit(AuthService()),
        child: const SignUpViewBody(),
      ),
    );
  }
}
