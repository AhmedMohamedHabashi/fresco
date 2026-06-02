import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/account/presentation/widgets/account_text_field.dart';

class AccountInfoField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onSave;

  const AccountInfoField({
    super.key,
    required this.title,
    required this.controller,
    required this.isEditing,
    required this.onEdit,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.bodyText16.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 5.h),

        AccountTextField(
          controller: controller,
          isEditing: isEditing,
          color: AppColors.primaryColor.withOpacity(0.1),
          onEditPressed: onEdit,
          onSavePressed: onSave,
        ),
      ],
    );
  }
}
