import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/feature/account/presentation/widgets/account_appbar.dart';
import 'package:fresco/feature/auth/presentation/login/widgets/welcome_widget.dart';

class AccountHeaderSection extends StatelessWidget {
  final String email;

  const AccountHeaderSection({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AccountAppBar(),

        WelcomeWidget(
          title: 'Welcome Back',
          subtitle: email.isNotEmpty ? email : 'No email',
          hotizontalPadding: false,
          colorText: true,
        ),

        SizedBox(height: 10.h),
      ],
    );
  }
}
