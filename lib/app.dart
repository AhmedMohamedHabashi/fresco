import 'package:flutter/material.dart';
import 'package:fresco/config/routes/app_router.dart';
import 'package:fresco/core/app_responsive.dart';

class FrescoApp extends StatelessWidget {
  const FrescoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Fresco App',
      ),
    );
  }
}
