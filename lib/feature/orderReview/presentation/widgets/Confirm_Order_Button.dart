import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/shared/custom_button.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class ConfirmOrderButton extends StatelessWidget {
  final String price;
  final VoidCallback onPressed;

  const ConfirmOrderButton({
    super.key,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: CustomButton(
        buttonText: "Confirm Order ($price)",
        onTap: onPressed,
        color: AppColors.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
