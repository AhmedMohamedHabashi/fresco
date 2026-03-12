import 'package:flutter/material.dart';
import 'package:fresco/core/app_responsive.dart';
import 'package:fresco/feature/auth/presentation/login/views/login_view.dart';

class FrescoApp extends StatelessWidget {
  const FrescoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Fresco App',
        home: const LoginView(),
      ),
    );
  }
}
