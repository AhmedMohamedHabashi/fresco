import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/shared/custom_search.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearch(
      hintText: 'What do you search for?',
      showBorder: true,
      borderColor: AppColors.primaryColor,
      borderWidth: 1.0,
      showShadow: false,
    );
  }
}
