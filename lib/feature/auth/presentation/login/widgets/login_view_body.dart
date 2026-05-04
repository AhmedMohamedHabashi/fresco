import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/shared/auth_header.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/shared/custom_text_field.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_state.dart';
import 'package:fresco/feature/auth/presentation/login/widgets/welcome_widget.dart';
import 'package:fresco/feature/auth/presentation/register/widgets/create_acc_line.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMsg)));
          }
          if (state is LoginSuccess) {
            context.push(AppRoutes.homeView);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const AuthHeader(),
              const WelcomeWidget(
                hotizontalPadding: true,
                title: 'Welcome Back to Fresco!',
                subtitle: 'Please sign in to continue',
                colorText: false,
              ),
              CustomTextField(controller: emailController),
              CustomTextField(
                controller: passwordController,
                title: 'Password',
                hintText: 'Enter your password',
                forgotPassword: true,
                obscureText: true,
              ),
              (state is AuthLoading)
                  ? const CircularProgressIndicator(color: AppColors.white)
                  : LoginButton(
                      buttonText: 'Login',
                      onTap: () {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill in all fields'),
                            ),
                          );
                          return;
                        }
                        context.read<AuthCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
              const CreateAccountLine(),
            ],
          );
        },
      ),
    );
  }
}
