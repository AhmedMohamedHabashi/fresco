import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title = 'Username',
    this.hintText = 'Enter your name',
    this.obscureText = false,
    this.forgotPassword = false,
  });

  final String title;
  final String hintText;
  final bool obscureText;
  final bool forgotPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppTextStyle.bodyText16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          TextField(
            obscureText: isObscure,
            cursorColor: AppColors.primaryColor,
            style: AppTextStyle.bodyText16.copyWith(
              color: AppColors.primaryColor,
            ),
            decoration: InputDecoration(
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: AppColors.mediumGrey),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          //انا هنا بشوف الاول هل دا بتاع الباسورد ولا لا لو اه
          // اعمل التيكست دي لو لا ابعت الويدجيت فاضيه
          //وحطيتها في نفس المتغير
          // اللي استخدمته في العين لان هو بيتحمل في الصفحه قبل ماالصفحه تفتح اصلا
          //obscureText دا المتغير اللي بستخدمه في صفات الباسورد
          widget.obscureText
              ? Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.forgotPassword ? 'Forgot Password' : '',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
