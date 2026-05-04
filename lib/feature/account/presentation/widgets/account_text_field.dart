import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTextField extends StatelessWidget {
  const AccountTextField({
    super.key,
    required this.value,
    required this.isEditing,
    required this.onPressed,
    required this.color,
    this.obscureText = false,
  });

  final String value;
  final bool isEditing;
  final VoidCallback onPressed;
  final Color color;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextFormField(
        initialValue: value,
        readOnly: !isEditing,
        obscureText: obscureText && !isEditing,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 12.h,
          ),
          suffixIcon: IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
