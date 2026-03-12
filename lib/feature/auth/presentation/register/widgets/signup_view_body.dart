import 'package:flutter/material.dart';
import 'package:fresco/core/shared/auth_header.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/shared/custom_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            const AuthHeader(height: 200),
            const SizedBox(height: 15),
            const CustomTextField(
              title: 'Full Name',
              hintText: 'Enter your Full Name',
            ),
            const CustomTextField(
              title: 'Mobile Number',
              hintText: 'Enter your Mobile no.',
            ),
            const CustomTextField(
              title: 'E-mail address',
              hintText: 'Enter your email address',
            ),
            const CustomTextField(
              title: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            LoginButton(buttonText: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
