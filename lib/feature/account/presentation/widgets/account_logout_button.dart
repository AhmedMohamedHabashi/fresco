import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';

class AccountLogoutButton extends StatelessWidget {
  const AccountLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: CustomButton(
        color: AppColors.primaryColor,
        textColor: AppColors.white,
        buttonText: 'Logout',
        onTap: () {
          context.read<AuthCubit>().logout();
        },
      ),
    );
  }
}
