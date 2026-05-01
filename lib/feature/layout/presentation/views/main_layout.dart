import 'package:flutter/material.dart';
import 'package:fresco/core/shared/custom_navigation_bar.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      navigationShell.goBranch(index);
    }

    return Scaffold(
      body: Stack(children: [navigationShell]),
      bottomNavigationBar: CustomNavigationBar(
        onTapHome: () => onTap(0),
        onTapCategory: () => onTap(1),
        onTapFavorite: () => onTap(2),
        onTapProfile: () => onTap(3),
      ),
    );
  }
}
