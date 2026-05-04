import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/account/presentation/widgets/body_account_view.dart';
import 'package:fresco/feature/auth/data/service/auth_service.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: BlocProvider(
            create: (context) => AuthCubit(AuthService()),
            child: const BodyAccountView(),
          ),
        ),
      ),
    );
  }
}
