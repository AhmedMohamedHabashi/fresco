import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/config/routes/app_routes.dart';
import 'package:fresco/core/constants/search_hints.dart';
import 'package:fresco/core/utils/helpers/search_hint_controller.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/home/presentation/widgets/list_item.dart';
import 'package:fresco/feature/home/presentation/widgets/main_header.dart';
import 'package:fresco/feature/home/presentation/widgets/section_title.dart';
import 'package:fresco/core/shared/custom_search.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late SearchHintController hintController;

  @override
  void initState() {
    super.initState();

    hintController = SearchHintController(hints: SearchHints.home);
  }

  @override
  void dispose() {
    hintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 280.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor.withOpacity(0.8),
                AppColors.primaryColor,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(170.r, 28.r),
              bottomRight: Radius.elliptical(170.r, 28.r),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h, right: 18.w, left: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MainHeader(),
                    SizedBox(height: 20),
                    SectionTitle(
                      isHeader: true,
                      title: "Popular Categories",
                      verticalPadding: 0,
                      horizontalPadding: 0,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              const CategoriesList(),
            ],
          ),
        ),

        Positioned(
          bottom: -15.h,
          left: 35.w,
          right: 35.w,
          child: ValueListenableBuilder<String>(
            valueListenable: hintController.notifier,
            builder: (context, value, _) {
              return CustomSearch(
                hintText: value,
                readOnly: true,
                onTap: () {
                  context.push(AppRoutes.searchView);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
