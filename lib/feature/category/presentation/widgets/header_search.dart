import 'package:flutter/material.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/shared/custom_search.dart';
import 'package:go_router/go_router.dart';

class HeaderSearch extends StatelessWidget {
  const HeaderSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearch(
      hintText: 'What do you search for?',
      showBorder: true,
      borderColor: AppColors.primaryColor,
      borderWidth: 1.0,
      readOnly: true,
      showShadow: false,
      onTap: () {
        context.push(AppRoutes.searchView);
      },
    );
  }
}
