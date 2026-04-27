import 'package:flutter/material.dart';
import 'package:fresco/core/shared/auth_header.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/shared/custom_text_field.dart';
import 'package:fresco/feature/auth/presentation/login/widgets/welcome_widget.dart';
import 'package:fresco/feature/auth/presentation/register/widgets/create_acc_line.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AuthHeader(),
          const WelcomeWidget(
            title: 'Welcome Back to Fresco!',
            subtitle: 'Please sign in to continue',
          ),
          const CustomTextField(),
          const CustomTextField(
            title: 'Password',
            hintText: 'Enter your password',
            forgotPassword: true,
            obscureText: true,
          ),
          const LoginButton(buttonText: 'Login'),
          const CreateAccountLine(),
        ],
      ),
    );
  }
}
