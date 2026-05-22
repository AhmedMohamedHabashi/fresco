import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/account/presentation/widgets/account_header.dart';
import 'package:fresco/feature/account/presentation/widgets/account_section_title.dart';
import 'package:fresco/feature/account/presentation/widgets/account_text_field.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_state.dart';
import 'package:fresco/feature/auth/presentation/login/widgets/welcome_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  final Map<String, bool> _isEditing = {
    'name': false,
    'email': false,
    'password': false,
    'phone': false,
    'address': false,
  };

  void toggleEdit(String field) {
    setState(() {
      _isEditing[field] = !(_isEditing[field] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LogoutSuccess) {
          final prefs = await SharedPreferences.getInstance();

          await prefs.setBool('isLoggedIn', false);
          await prefs.remove('name');
          await prefs.remove('email');

          if (!mounted) return;
          context.go(AppRoutes.signInView);
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMsg)));
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountAppBar(),

            const WelcomeWidget(
              title: 'Welcome Back, Test',
              subtitle: 'Test@gmail.com',
              hotizontalPadding: false,
              colorText: true,
            ),

            SizedBox(height: 10.h),

            const AccountSectionTitle(
              title: 'Your full name',
              color: AppColors.primaryColor,
            ),

            AccountTextField(
              value: 'Test',
              isEditing: _isEditing['name']!,
              onPressed: () => toggleEdit('name'),
              color: AppColors.primaryColor,
            ),

            const AccountSectionTitle(
              title: 'Your E-mail',
              color: AppColors.primaryColor,
            ),

            AccountTextField(
              value: 'test@gmail.com',
              isEditing: _isEditing['email']!,
              onPressed: () => toggleEdit('email'),
              color: AppColors.primaryColor,
            ),

            const AccountSectionTitle(
              title: 'Your mobile number',
              color: AppColors.primaryColor,
            ),

            AccountTextField(
              value: '0123456789',
              isEditing: _isEditing['phone']!,
              onPressed: () => toggleEdit('phone'),
              color: AppColors.primaryColor,
            ),

            const AccountSectionTitle(
              title: 'Your Address',
              color: AppColors.primaryColor,
            ),

            AccountTextField(
              value: 'Alexandria',
              isEditing: _isEditing['address']!,
              onPressed: () => toggleEdit('address'),
              color: AppColors.primaryColor,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: state is AuthLoading
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      color: AppColors.primaryColor,
                      textColor: AppColors.white,
                      buttonText: 'Logout',
                      onTap: () {
                        context.read<AuthCubit>().logout();
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
