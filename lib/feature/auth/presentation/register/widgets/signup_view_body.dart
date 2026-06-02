import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/shared/auth_header.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/shared/custom_text_field.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:fresco/feature/auth/presentation/cubit/auth_state.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
          if (state is SignUpSuccess) {
            context.push(AppRoutes.homeView);
          }
        },

        builder: (context, state) => SafeArea(
          top: false,
          child: Column(
            children: [
              const AuthHeader(height: 210),

              CustomTextField(
                controller: nameController,
                title: 'Full Name',
                hintText: 'Enter your Full Name',
              ),

              CustomTextField(
                controller: phoneController,
                title: 'Mobile Number',
                hintText: 'Enter your Mobile no.',
              ),

              CustomTextField(
                controller: addressController,
                title: 'Address',
                hintText: 'Enter your address',
              ),

              CustomTextField(
                controller: emailController,
                title: 'E-mail address',
                hintText: 'Enter your email address',
              ),

              CustomTextField(
                controller: passwordController,
                title: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),

                child: (state is AuthLoading)
                    ? const CircularProgressIndicator(color: AppColors.white)
                    : CustomButton(
                        buttonText: 'Sign Up',
                        onTap: () {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              phoneController.text.isEmpty ||
                              addressController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Text('Please fill all the fields'),
                                    ),
                                  ],
                                ),
                                backgroundColor: AppColors.errColor,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.all(12.w),
                              ),
                            );
                            return;
                          }
                          context.read<AuthCubit>().signUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            address: addressController.text,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
