import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/constants/search_hints.dart';
import 'package:fresco/core/utils/helpers/search_hint_controller.dart';
import 'package:fresco/core/shared/custom_search.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/search/presentation/cubit/search_cubit.dart';
import 'package:go_router/go_router.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}

class _SearchAppBarState extends State<SearchAppBar> {
  late SearchHintController hintController;

  @override
  void initState() {
    super.initState();

    hintController = SearchHintController(hints: SearchHints.search);
  }

  @override
  void dispose() {
    hintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
          size: 27.sp,
        ),
        onPressed: () => context.pop(),
      ),
      title: ValueListenableBuilder<String>(
        valueListenable: hintController.notifier,
        builder: (context, value, _) {
          return CustomSearch(
            hintText: value,
            showShadow: false,
            showBorder: true,
            borderWidth: 1,
            onChanged: (value) {
              context.read<SearchCubit>().onSearchChanged(value);
            },
          );
        },
      ),
    );
  }
}
